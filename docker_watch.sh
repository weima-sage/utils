#!/usr/local/bin/bash
while :
do
  clear
  date
  docker-compose ps |grep -Ev 'database-.*Exit 0' | less -SEX $tmpf
  sleep 3
done
