#!/bin/bash

echo "======================================System Information======================================"

HOSTNAME=$(hostname)
OS_NAME=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d '"' -f2)
KERNEL=$(uname -r)
ARCH=$(uname -m)
UPTIME=$(uptime -p)
LOAD_AVERAGE=$(awk '{print $1, $2, $3} ' /proc/loadavg)
LOGGED_USERS=$(who | wc -l)
CPU_MODEL=$(lscpu | grep "Model name" | cut -d ':' -f2 | xargs)
CPU_CORES=$(nproc)

LOAD_1=$(awk '{print $1}' /proc/loadavg)

if awk "BEGIN {exit !($LOAD_1 < CPU_CORES)}"; then
	LOAD_STATUS="NORMAL"
else
	LOAD_STATUS="HIGH"
fi

echo "Hostname	:$HOSTNAME"
echo "Operating System:$OS_NAME"
echo "Kernel Version	:$KERNEL"
echo "Architecture	:$ARCH"
echo "CPU Model	:$CPU_MODEL"
echo "CPU Cores	:$CPU_CORES"
echo "Uptime		:$UPTIME"
echo "Load Average	:$LOAD_AVERAGE"
echo "Load Status	:$LOAD_STATUS"
echo "Logged-in Users	:$LOGGED_USERS"

echo "=============================================================================================="
