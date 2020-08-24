#!/usr/local/bin/bash
while :
do
  clear
  docker stats --no-stream --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}" | sort -k 9 -n
  sleep 60
done
