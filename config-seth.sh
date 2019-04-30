#!/usr/bin/env false

# 是否启用 seth 服务，如为 'disable'，将忽略以下全部配置，如果为 'enable'，则启用 SETH_ADD_USER，并且在  SETH_CRON_ADD 为 1 时添加计划任务，如果为 'cron-only'，将忽略 SETH_ADD_USER 但在 SETH_CRON_ADD 为 1 时添加计划任务
SETH_ENABLE='enable'

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
