#!/bin/bash

echo "======================================Disk Monitoring======================================"

DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_AVAILABLE=$(df -h / | awk 'NR==2 {print $4}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

DISK_USAGE_NUM=${DISK_USAGE%\%}

if [ "$DISK_USAGE_NUM" -lt 80 ]; then
	DISK_STATUS="NORMAL"
elif [ "$DISK_USAGE_NUM" -lt 90 ]; then
	DISK_STATUS="WARNING"
else
	DISK_STATUS="CRITICAL"
fi

echo "Filesystem	: /"
echo "Total Space	: $DISK_TOTAL"
echo "Used Space	: $DISK_USED"
echo "Available Space	: $DISK_AVAILABLE"
echo "Usage		: $DISK_USAGE"
echo "Disk Status	: $DISK_STATUS"

echo "==========================================================================================="
