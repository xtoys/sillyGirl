#!/bin/bash

echo -e "\n======================== sillyGirl Bot ========================\n"

# 静默启动主服务程序
/app/sillyGirl -d

# 定时任务程序守护进程
[[ ! -f task ]] && touch task
[[ $(cat task) != $(crontab -l) ]] && crontab task 
crond -f >/dev/null 2>&1

exec "$@"