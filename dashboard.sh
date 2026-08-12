#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE_DIR="$SCRIPT_DIR/modules"

source "$MODULE_DIR/colors.sh"

REFRESH_INTERVAL=60

cleanup() {
	clear
	echo ""
	echo "======================================================================================================"
	echo "                        Linux System Monitoring Dashboard Stopped                                     "
	echo "======================================================================================================"
	echo ""
	exit 0
}

trap cleanup SIGINT SIGTERM

while true
do
	clear

	echo -e  "${CYAN}=====================================================================================================${RESET}"
	echo -e  "                           LINUX SYSTEM MONITORING DASHBOARD"
	echo -e  "${CYAN}=====================================================================================================${RESET}"

	echo ""
	echo "Hostname : $(hostname)"
	echo "User     : $(whoami)"
	echo "Date     : $(date)"
	echo ""

	echo ""
	"$MODULE_DIR/cpu.sh"

	echo ""
	"$MODULE_DIR/memory.sh"

	echo ""
	"$MODULE_DIR/disk.sh"

	echo ""
	"$MODULE_DIR/process.sh"

	echo ""
	"$MODULE_DIR/network.sh"

	echo ""
	"$MODULE_DIR/system.sh"

	echo ""
	"$MODULE_DIR/health.sh"

	echo ""
	echo "====================MONITORING LOG===================="
	"$MODULE_DIR/logger.sh"

	echo ""
	echo "============================================================"
	echo " Refreshing in $REFRESH_INTERVAL seconds..."
	echo " Press Ctrl+c to exit"
	echo "============================================================"

	sleep "$REFRESH_INTERVAL"
done
