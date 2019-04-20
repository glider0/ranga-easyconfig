#!/usr/bin/env bash

. config-defaults.sh
[ -f config-my.sh ] && . config-my.sh
. preuser.sh

ranga-cli auth -e

echo "=> config user '$USER_MAIN' with passwd '$PASS_MAIN' to if 'netkeeper'"
ranga-cli config interface set netkeeper usrnam "$USER_MAIN"
ranga-cli config interface set netkeeper passwd "$PASS_MAIN"

if [ "$USE_MULTI_HOMING" = '1' ]; then
	echo "=> enable multiple homing"
	ranga-cli config mwan enable

	ranga-cli config mwan add netkeeper

	w='97'
	nrvlan='0'
	for i in "${USERS_EXTRA[@]}"; do
		[ -z "$i" ] && continue

		tmp=`printf %x "$w"`
		alpha=`printf "\x$tmp"`
		if="md$alpha"
		w=$(($w + 1))

		user="${i% *}"
		pass="${i#* }"

		echo "=> config user '$user' with passwd '$pass' to if '$if'"
		echo "   rvlan ID: $nrvlan"
		ranga-cli config interface add "$if"
		ranga-cli config interface set "$if" type pppoe
		ranga-cli config interface set "$if" nkplugin nkplugin
		ranga-cli config interface set "$if" usrnam "$user"
		ranga-cli config interface set "$if" passwd "$pass"
		ranga-cli config interface set "$if" rvlan "$nrvlan"
		ranga-cli config mwan add "$if"

		nrvlan=$(($nrvlan + 1))
	done

	ranga-cli config misc set-misc rvlan "$nrvlan"
fi

echo "=> config wifi to ssid:'$WIFI_SSID' key:'$WIFI_KEY' suffix:'$WIFI_ADD_HZ_SUFFIX'"
ranga-cli config wifi auto "$WIFI_SSID" "$WIFI_KEY" "$WIFI_ADD_HZ_SUFFIX"
ranga-cli action restart wireless

if [ -n "$WIFI_SET_REG_DOMAIN" ]; then
	echo "=> set reg domain for card 0"
	ranga-cli config wifi set 0 country "$WIFI_SET_REG_DOMAIN"
	echo "=> set reg domain for card 1, it may failed if you have only one wifi card"
	ranga-cli config wifi set 1 country "$WIFI_SET_REG_DOMAIN"
fi

echo "=> misc configs"
[ "$MISC_NEW_EXP_CATCHING" = '1' ] && {
	echo "   enable new and exp catching"
	ranga-cli config misc set-flag enable_forever_nkserver 1
}
[ "$MISC_CRON_AUTOSTART" = '1' ] && {
	echo "   enable cron autostart"
	ranga-cli config misc set-flag enable_cron_autostart 1
}
[ "$MISC_OFFLOAD" = '1' ] && {
	echo "   enable flow offload"
	ranga-cli config svc offload enable
}

echo "=> bypass 'setup-wizard'"
ranga-cli addon set-webcon ranga.webcon

[ -n "$SUPER_PASSWD" ] && {
	echo "=> change super password"
	ranga-cli config misc set-passwd "$SUPER_PASSWD"
}

for i in "${INSTALL_EXT_LIST[@]}"; do
	[ -z "$i" ] && continue
	ranga-cli addon install-extension "$i"
done

[ -n "$QOS_RULE_FILE" ] && {
	echo "=> setup QoS"
	ranga-cli config qos enable
	ranga-cli config --raw qos < "$QOS_RULE_FILE"
}

[ "$OPT_SVC_ARIA2" = '1' ] && {
	echo "=> enable opt server 'aria2'"
	ranga-cli action opt enable aria2
	[ -n "$OPT_SVC_ARIA2_CH_PASS" ] && {
		echo "   change aria2_rpc_secret"
		ranga-cli config misc set-misc aria2_rpc_secret "$OPT_SVC_ARIA2_CH_RPC_SECRET"
	}
}

[ "$OPT_SVC_SAMBA" = '1' ] && {
	echo "=> enable opt server 'samba'"
	ranga-cli action opt enable samba
	echo "   change samba user token"
	ranga-cli action opt action samba set-passwd "$OPT_SVC_SAMBA_USER_TOKEN"
}

. postuser.sh

tryreboot='1'
if [ -n "$SOC_MT7620_RADIO_DRIVER" ]; then
	ranga-cli config mtk set-mode "$SOC_MT7620_RADIO_DRIVER"
	[ "$?" = "0" ] && tryreboot='0'
fi

[ "$tryreboot" = '1' ] && {
	if [ "$REBOOT_IMMEDIATELY" = '1' ]; then
		echo "=> rebooting..."
		ranga-cli action restart system
	else
		echo "Warning: you may need reboot to make some config taken effect!"
	fi
}
