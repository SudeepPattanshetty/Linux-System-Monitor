#!/bin/bash

echo "=============================================="
echo " Linux System Monitoring Dashboard Installer"
echo "=============================================="

echo ""
echo "Checking required commands..."

COMMANDS=(
    bash
    awk
    grep
    sed
    df
    free
    ps
    top
    lscpu
    ip
    ss
)

for COMMAND in "${COMMANDS[@]}"; do

    if command -v "$COMMAND" >/dev/null 2>&1; then
        echo "[OK] $COMMAND"
    else
        echo "[MISSING] $COMMAND"
    fi

done

echo ""
echo "Making scripts executable..."

chmod +x dashboard.sh
chmod +x modules/*.sh

mkdir -p logs
mkdir -p screenshots
mkdir -p docs

echo ""
echo "Installation completed."
echo ""
echo "Run the dashboard using:"
echo "./dashboard.sh"
