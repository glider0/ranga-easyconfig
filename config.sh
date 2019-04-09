#!/bin/bash

export RANGAPASS='ranga'

USER_MAIN=178aaaaaaaa
PASS_MAIN=123123

USE_MULTI_HOMING='1'
USERS_EXTRA=( \
	'178xxxxxxxx 123123' \
	'178yyyyyyyy 123123' \
	'178zzzzzzzz 123123' \
)

WIFI_SSID="Ranga Easy-config"
WIFI_KEY="password"
WIFI_ADD_HZ_SUFFIX=1

ranga-cli auth -e

echo "=> config user '$USER_MAIN' with passwd '$PASS_MAIN' to if 'netkeeper'"
ranga-cli config interface set netkeeper usrnam "$USER_MAIN"
ranga-cli config interface set netkeeper passwd "$PASS_MAIN"

if [ "$USE_MULTI_HOMING" = '1' ]; then
	echo "=> enable multiple homing"
	ranga-cli config mwan enable
fi

w='97'
nrvlan='0'
for i in "${USERS_EXTRA[@]}"; do
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
	ranga-cli config interface set "$if" nkplugin on
	ranga-cli config interface set "$if" usrnam "$user"
	ranga-cli config interface set "$if" passwd "$pass"
	ranga-cli config interface set "$if" rvlan "$nrvlan"
	ranga-cli config mwan add "$if"

	nrvlan=$(($nrvlan + 1))
done

echo "=> config wifi to ssid:'$WIFI_SSID' key'$WIFI_KEY' suffix:'$WIFI_ADD_HZ_SUFFIX'"
ranga-cli config wifi auto "$WIFI_SSID" "$WIFI_KEY" "$WIFI_ADD_HZ_SUFFIX"
ranga-cli action restart wireless

echo "=> misc configs"
ranga-cli config misc set-flag enable_forever_nkserver 1
ranga-cli config misc set-misc rvlan "$nrvlan"
ranga-cli config svc offload enable

ranga-cli addon set-webcon ranga.webcon

echo "NOTE: you may need reboot to make some config taken effect!"
