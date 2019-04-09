# NSWA Ranga Easy-Config 自动配置脚本

## 为什么会有这个脚本

很多用户抱怨更新完整包后系统配置会丢失，然后不得不重复配置很多工作，但是，NSWA Ranga 具有强大的脚本化能力，定制一个属于你的一键“初始化”脚本非常简单，得益于 [命令行客户端](https://github.com/glider0/ranga-client/)，创造力得以一定程度的解放。

## 要如何配置

你需要根据你的需要修改 `config.sh` 的钱几行

```
export RANGAPASS='ranga'

USER_MAIN=178aaaaaaaa  # 你的第一个账户
PASS_MAIN=123123       # 你的第一个账户的密码

USE_MULTI_HOMING='1'   # 如果不使用多宿主，应设置为 0,且清空下面的数组
# 这个数组包含多宿主的账户，每一行一个，账户和密码用空格分割，需要几个写几行
USERS_EXTRA=( \
	'178xxxxxxxx 123123' \
	'178yyyyyyyy 123123' \
	'178zzzzzzzz 123123' \
)

# Wifi 的 SSID 和 Key
WIFI_SSID="Ranga Easy-config"
WIFI_KEY="password"
WIFI_ADD_HZ_SUFFIX=1   # 如果不希望添加频率后戳，应设置为 0
```

脚本还进行了一些其他配置，你可以进行修改以满足你的个性需要

如果需要最后修改密码，则可以添加

```
ranga-cli config misc set-passwd '新密码'
```

如果需要启用联发科的驱动程序

```
ranga-cli config mtk set-mode ....
```

请参考手册，你需要的一切这里都有： https://glider0.github.io/doc.zh/euman.html
