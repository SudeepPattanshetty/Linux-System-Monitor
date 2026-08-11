#!/bin/bash

# Project directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/system-monitor.log"

mkdir -p "$LOG_DIR"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# --------------------------------------------------
# CPU Usage
# --------------------------------------------------

CPU_IDLE_1=$(awk '/^cpu / {print $5}' /proc/stat)
CPU_TOTAL_1=$(awk '/^cpu / {sum=0; for(i=2;i<=NF;i++) sum+=$i; print sum}' /proc/stat)

sleep 0.2

CPU_IDLE_2=$(awk '/^cpu / {print $5}' /proc/stat)
CPU_TOTAL_2=$(awk '/^cpu / {sum=0; for(i=2;i<=NF;i++) sum+=$i; print sum}' /proc/stat)

IDLE_DIFF=$((CPU_IDLE_2 - CPU_IDLE_1))
TOTAL_DIFF=$((CPU_TOTAL_2 - CPU_TOTAL_1))

if [ "$TOTAL_DIFF" -gt 0 ]; then
    CPU_USAGE=$(awk "BEGIN {printf \"%.0f\", 100 - (($IDLE_DIFF / $TOTAL_DIFF) * 100)}")
else
    CPU_USAGE=0
fi

# --------------------------------------------------
# Memory Usage
# --------------------------------------------------

MEM_TOTAL=$(free | awk '/^Mem:/ {print $2}')
MEM_USED=$(free | awk '/^Mem:/ {print $3}')

MEM_USAGE=$(awk "BEGIN {printf \"%.0f\", ($MEM_USED / $MEM_TOTAL) * 100}")

# --------------------------------------------------
# Disk Usage
# --------------------------------------------------

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
DISK_USAGE_NUM=${DISK_USAGE%\%}

# --------------------------------------------------
# Zombie Processes
# --------------------------------------------------

ZOMBIE_PROCESSES=$(ps -eo stat --no-headers | grep '^Z' | wc -l)

# --------------------------------------------------
# Health Status
# --------------------------------------------------

STATUS="HEALTHY"

if [ "$CPU_USAGE" -ge 90 ] || \
   [ "$MEM_USAGE" -ge 90 ] || \
   [ "$DISK_USAGE_NUM" -ge 90 ]; then

    STATUS="CRITICAL"

elif [ "$CPU_USAGE" -ge 80 ] || \
     [ "$MEM_USAGE" -ge 80 ] || \
     [ "$DISK_USAGE_NUM" -ge 80 ] || \
     [ "$ZOMBIE_PROCESSES" -gt 0 ]; then

    STATUS="WARNING"
fi

# --------------------------------------------------
# Create Log Entry
# --------------------------------------------------

LOG_ENTRY="$TIMESTAMP | CPU=$CPU_USAGE% | MEMORY=$MEM_USAGE% | DISK=$DISK_USAGE | ZOMBIE=$ZOMBIE_PROCESSES | STATUS=$STATUS"

echo "$LOG_ENTRY" >> "$LOG_FILE"

echo "Log recorded:"
echo "$LOG_ENTRY"
