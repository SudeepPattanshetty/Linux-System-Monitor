#!/bin/bash

echo "======================================Memory Monitoring====================================="

MEM_T=$(free | awk '/^Mem:/ {print $2}')
MEM_U=$(free | awk '/Mem:/ {print $3}')

MEM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
MEM_USED=$(free -h | awk '/^Mem:/ {print $3}')
MEM_FREE=$(free -h | awk '/^Mem:/ {print $4}')
MEM_AVAILABLE=$(free -h | awk '/^Mem:/ {print $7}')

MEM_USAGE=$(awk "BEGIN {printf \"%.2f\", ($MEM_U / $MEM_T) * 100}")

echo "Total Memory : $MEM_TOTAL"
echo "Used Memory : $MEM_USED"
echo "Free Memory : $MEM_FREE"
echo "Available : $MEM_AVAILABLE"
echo "Memory Usage : $MEM_USAGE%"

echo "============================================================================================"
