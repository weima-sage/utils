#!/bin/bash

# No body likes MCAfee
while :
do
  `pkill VShield`
  `pkill masvc`
  `pkill ampdaemon`
  `pkill ampscansvn`
  `pkill ampcreport`
  sleep 1
done
