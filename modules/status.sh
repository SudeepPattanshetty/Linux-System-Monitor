#!/bin/bash

source "$(dirname "${BASE_SOURCE[0]}")/colors.sh"

show_status() {

	STATUS="$1"

	case "$STATUS" in
		NORMAL|HEALTHY) 
			echo -e "${GREEN}$STATUS${RESET}"
		;;
		WARNING)
			echo -e "${YELLOW}$STATUS${RESET}"
		;;
		CRITICAL)
			echo -e "${RED}$STATUS${RESET}"

		;;
		*)
			echo -e "${WHITE}$STATUS${RESET}"
		;;
		esac
}

