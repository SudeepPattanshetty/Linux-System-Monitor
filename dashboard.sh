#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASE_SOURCE[0]}")" && pwd)"
MODULE_DIR="$SCRIPT_DIR/modules"

clear

echo "====================================================================================================="
echo "                           Linux System Monitoring Dashboard   "
echo "====================================================================================================="

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

echo""
"$MODULE_DIR/network.sh"

echo ""
"$MODULE_DIR/system.sh"

echo""
echo "====================================================================================================="


