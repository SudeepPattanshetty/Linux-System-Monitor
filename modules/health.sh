#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/colors.sh"
source "$(dirname "${BASH_SOURCE[0]}")/status.sh"

echo "============================================================"
echo "                 SYSTEM HEALTH STATUS"
echo "============================================================"

# CPU Usage
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
CPU_USAGE=$(awk "BEGIN {printf \"%.0f\", 100 - $CPU_IDLE}")

if [ "$CPU_USAGE" -lt 80 ]; then
    CPU_STATUS="NORMAL"
elif [ "$CPU_USAGE" -lt 90 ]; then
    CPU_STATUS="WARNING"
else
    CPU_STATUS="CRITICAL"
fi

# Memory Usage
MEM_TOTAL=$(free | awk '/^Mem:/ {print $2}')
MEM_USED=$(free | awk '/^Mem:/ {print $3}')
MEM_USAGE=$(awk "BEGIN {printf \"%.0f\", ($MEM_USED / $MEM_TOTAL) * 100}")

if [ "$MEM_USAGE" -lt 80 ]; then
    MEM_STATUS="NORMAL"
elif [ "$MEM_USAGE" -lt 90 ]; then
    MEM_STATUS="WARNING"
else
    MEM_STATUS="CRITICAL"
fi

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
DISK_USAGE_NUM=${DISK_USAGE%\%}

if [ "$DISK_USAGE_NUM" -lt 80 ]; then
    DISK_STATUS="NORMAL"
elif [ "$DISK_USAGE_NUM" -lt 90 ]; then
    DISK_STATUS="WARNING"
else
    DISK_STATUS="CRITICAL"
fi

# Zombie Processes
ZOMBIE_PROCESSES=$(ps -eo stat --no-headers | grep '^Z' | wc -l)

if [ "$ZOMBIE_PROCESSES" -eq 0 ]; then
    ZOMBIE_STATUS="NORMAL"
else
    ZOMBIE_STATUS="WARNING"
fi

# Overall Status
OVERALL_STATUS="HEALTHY"

if [ "$CPU_STATUS" = "CRITICAL" ] || \
   [ "$MEM_STATUS" = "CRITICAL" ] || \
   [ "$DISK_STATUS" = "CRITICAL" ]; then

    OVERALL_STATUS="CRITICAL"

elif [ "$CPU_STATUS" = "WARNING" ] || \
     [ "$MEM_STATUS" = "WARNING" ] || \
     [ "$DISK_STATUS" = "WARNING" ] || \
     [ "$ZOMBIE_STATUS" = "WARNING" ]; then

    OVERALL_STATUS="WARNING"
fi

echo ""
echo -n "CPU Usage        : $CPU_USAGE%      	"
show_status "$CPU_STATUS"
echo -n "Memory Usage     : $MEM_USAGE%     	"
show_status "$MEM_STATUS"
echo -n "Disk Usage       : $DISK_USAGE   	"
show_status "$DISK_STATUS"
echo -n "Zombie Processes : $ZOMBIE_PROCESSES		"
show_status "$ZOMBIE_STATUS"

echo ""
echo "------------------------------------------------------------"
echo -n "Overall Status   :	"
show_status "$OVERALL_STATUS"
echo "============================================================"
