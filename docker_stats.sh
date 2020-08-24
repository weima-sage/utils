#!/usr/local/bin/bash

# Display docker stats sorted by memory usage
#https://unix.stackexchange.com/questions/11856/sort-but-keep-header-line-at-the-top
# print the header (the first line of input)
# and then run the specified command on the body (the rest of the input)
# use it in a pipeline, e.g. ps | body grep somepattern
body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}

while :
do
  clear
  docker stats --no-stream --format "table {{.MemPerc}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.Name}}" | \
    body sort -k5 -nr
  sleep 60
done
