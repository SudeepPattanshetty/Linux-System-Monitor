#!/bin/bash

echo "====================CPU Monitoring====================================="

CPU_MODEL=$(lscpu | grep "Model name" | cut -d ':' -f2 | xargs)
CPU_CORES=$(nproc)
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
CPU_USAGE=$(awk "BEGIN {printf \"%.2f\", 100 - $CPU_IDLE}")

echo "CPU Model : $CPU_MODEL"
echo "CPU Cores : $CPU_CORES"
echo "CPU Usage : $CPU_USAGE%"

echo "======================================================================="
