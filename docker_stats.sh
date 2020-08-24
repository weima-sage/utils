#!/usr/local/bin/bash

# Display docker stats sorted by memory usage
while :
do
  clear
  docker stats --no-stream --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}" | sort -k 9 -n
  sleep 60
done
