#!/usr/bin/env false

export RANGAPASS='ranga'

# 你的第一个账户、密码
USER_MAIN='178aaaaaaaa'
PASS_MAIN='123123'

# 如果不使用多宿主，应设置为 0
USE_MULTI_HOMING=1
# 如果使用多宿主，则这个数组包含多宿主的账户，每一行一个，账户和密码用空格分割，需要几个写几行
USERS_EXTRA=( \
	'178xxxxxxxx 123123' \
	'178yyyyyyyy 123123' \
	'178zzzzzzzz 123123' \
)

# Wifi 的 SSID 和 Key
WIFI_SSID="Ranga Easy-config"
WIFI_KEY="password"
# 如果不希望添加频率后戳，应设置为 0
WIFI_ADD_HZ_SUFFIX=1

# 设置无线电监管域，留空不修改
WIFI_SET_REG_DOMAIN='TW'

# 是否启用流量卸载
MISC_OFFLOAD=1

# 是否开机自动启动计划任务服务，若启用 Seth 服务且启用自动同步，此设置将忽略并开启开机自动启动计划任务服务
MISC_CRON_AUTOSTART=0

# 是否启用实验性新型拦截法
MISC_NEW_EXP_CATCHING=1

# 修改超级密码，留空不修改
SUPER_PASSWD=''

# 如果要安装一系列扩展程序，请将它们列在此处
# INSTALL_EXT_LIST=( \
# 	'/path/to/xxx.zip' \
# 	'/path/to/yyy.zip' \
# )
INSTALL_EXT_LIST=()

# 是否启用 QoS，留空不启用，否则为 QoS 规则文件路径
QOS_RULE_FILE=''

# 非空设置 MT7620 平台的专有驱动程序，且会导致系统重启
# linux-wireless-only
# rt2860-mtk-with-any5ghz-linux-wireless
# rt2860-mtk-with-mt7612e-mtk
SOC_MT7620_RADIO_DRIVER=''

# 如果不希望立即重启，应设置为 0
REBOOT_IMMEDIATELY=1
