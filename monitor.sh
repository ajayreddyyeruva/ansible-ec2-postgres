#!/bin/bash
CPU1=$( mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12"" }')
CPU2=${CPU1%.*}
filsiz=$(df -aPh|awk '{print $5}'|grep [0-9]| cut -d% -f1|sort -n| tail -1)
memsiz1=$(free -m|grep Mem|awk '{print $3/$2*100}')
memsiz2=${memsiz1%.*}
if [ "$CPU2" -gt 95 ] || [ "$filsiz" -gt 90 ] || [ "$memsiz2" -lt 5 ];then
echo "Hostname is having issues with CPU Utilization or Disk Space or Memory Usage" |mail -s Warning ajayreddy1332@gmail.com
else
exit 0
Fi
