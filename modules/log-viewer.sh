#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_FILE="$PROJECT_DIR/logs/system-monitor.log"

echo "================================== LOG VIEWER ==================================="

if [ ! -f "$LOG_FILE" ]; then
	echo "No monitoring logs found"
	exit 0
fi

echo ""
echo "Last 10 Monitoring Events"
echo "---------------------------------------------------------------------------------"

tail -n 10 "$LOG_FILE"

echo ""
echo "---------------------------------------------------------------------------------"
