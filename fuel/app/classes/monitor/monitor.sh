#!/bin/bash -e
while true
do

HTTPD=`ps aux | grep httpd | grep -v grep | wc -l`
DB=`ps aux | grep postgres | grep -v grep | wc -l`
DISK=`df -h | awk NR==2 | awk '{print $3}' | sed 's/G//g'`
READ=`tail -n 1 vmstat.log | awk '{print $1}'`
WRITE=`tail -n 1 vmstat.log | awk '{print $2}'`
FREEMEM=`tail -n 1 vmstat.log | awk '{print $4}'`
CPU=`tail -n 1 vmstat.log | awk '{print $13+$14}'`
 
echo $HTTPD,$DB,$DISK,$READ,$WRITE,$FREEMEM,$CPU,`date +"%k:%M:%S"` >> monitor_`date +%Y%m%d`.csv

# rm vmstat.log_`date -d '1 days ago' +%Y%m%d` 
sleep 10
done
