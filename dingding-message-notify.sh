#!/bin/bash

pkill -9 dbus-monitor

# 双引号中包含的是过滤条件
# 过滤条件需要 dbus-monitor打开调试一下
nohup dbus-monitor  "type='signal',sender='org.freedesktop.DBus',destination=':1.17', member='NameAcquired'" | while read file
do
    # 判断 file 中是否包含钉钉的消息
    if [[ "${file}" =~ ":1.17" ]];then
        notify-send 有未读消息
    fi
    # echo "==================================================================="
    # echo $file
    
    # 语音提示，这个我暂时没有开
    #ffplay -i ~/.msgq/msg.wav -hide_banner -showmode 0 -autoexit &> /dev/null &
done &