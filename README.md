# NSWA Ranga Easy-Config 自动配置脚本

## 为什么会有这个脚本

很多用户抱怨更新完整包后系统配置会丢失，然后不得不重复配置很多工作，但是，NSWA Ranga 具有强大的脚本化能力，定制一个属于你的一键“初始化”脚本非常简单，得益于 [命令行客户端](https://github.com/glider0/ranga-client/)，创造力得以一定程度的解放。

## 要如何配置

复制 `config-defaults.sh` 到 `config-my.sh` 并进行你需要根据你的需要修改，当然，你也可以直接修改 `config-defaults.sh`，但不推荐。

```
#!/usr/bin/env false

export RANGAPASS='ranga'

# 你的第一个账户、密码
USER_MAIN='178aaaaaaaa'
PASS_MAIN='123123'

# 如果不使用多宿主，应设置为 0
USE_MULTI_HOMING='1'
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

# 是否开机自动启动计划任务服务
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

# 是否启用 aria2 “额外（可选）服务”，如果系统支持
OPT_SVC_ARIA2=1
# aria2 “额外（可选）服务”修改密码，留空保持默认密码
OPT_SVC_ARIA2_CH_RPC_SECRET=''
# 是否启用 samba “额外（可选）服务”，如果系统支持
OPT_SVC_SAMBA=1
# samba “额外（可选）服务”修改密码
OPT_SVC_SAMBA_USER_TOKEN='123456'

# 非空设置 MT7620 平台的专有驱动程序，且会导致系统重启
# linux-wireless-only
# rt2860-mtk-with-any5ghz-linux-wireless
# rt2860-mtk-with-mt7612e-mtk
SOC_MT7620_RADIO_DRIVER=''

# 如果不希望立即重启，应设置为 0
REBOOT_IMMEDIATELY=1
```

更新完整包系统后，不要在 Web 控制台上进行任何操作，运行 `./initsystem.sh` 开始配置系统，不可重复运行

另外，如果需要执行自定义命令，你应该写入 `preuser.sh` 和 `postuser.sh` 以避免污染主要脚本。

请参考手册，你需要的一切这里都有： https://glider0.github.io/doc.zh/euman.html
