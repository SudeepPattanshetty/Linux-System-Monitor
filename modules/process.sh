#!/bin/bash

echo "========================================Process Monitoring============================================"

TOTAL_PROCESSES=$(ps -e --no-headers | wc -l)
RUNNING_PROCESSES=$(ps -eo stat --no-headers | grep '^R' | wc -l)
SLEEPING_PROCESSES=$(ps -eo stat --no-headers | grep '^[SDI]' | wc -l)
ZOMBIE_PROCESSES=$(ps -eo stat --no-headers | grep '^Z' | wc -l)
STOPPED_PROCESS=$(ps -eo stat --no-headers | grep '^[Tt]' | wc -l)

echo "Total Processes	 : $TOTAL_PROCESSES"
echo "Running Processes	 : $RUNNING_PROCESSES"
echo "Sleeping Processes : $SLEEPING_PROCESSES"
echo "Stopped Processes	 : $STOPPED_PROCESS"
echo "Zombie Processes:	 : $ZOMBIE_PROCESSES"

echo ""
echo "Top CPU Processes"
echo "--------------------------------------------------------------"

ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 10

echo "--------------------------------------------------------------"

echo ""
echo "Top Memory Processes"
echo "--------------------------------------------------------------"

ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 10

echo "--------------------------------------------------------------"

echo "======================================================================================================"
