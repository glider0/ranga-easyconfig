#!/usr/bin/env false

# 是否启用 seth 服务，如为 0，将忽略以下全部配置
SETH_ENABLE=0

# Seth 添加订阅
SETH_ADD_USER=( \
	'178aaaaaaaa xxxxxxxxxxxx' \
	'178xxxxxxxx xxxxxxxxxxxx' \
)

# Seth 设置计划任务
SETH_CRON_ADD=1

# 执行同步的小时和分钟，分钟留空将随机生成
SETH_CRON_TIME_H=2
SETH_CRON_TIME_M=
