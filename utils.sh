#!/bin/bash
pause(){ read -p "Press Enter to continue..."; }

validate_api_key() {
    local token="$1"
    local code=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: Bearer $token" https://api.digitalocean.com/v2/account)
    [ "$code" = "200" ]
}

load_active(){
    [ -f "$ACTIVE_FILE" ] || return
    ACTIVE_NAME=$(cut -d'|' -f1 "$ACTIVE_FILE")
    ACTIVE_TOKEN=$(cut -d'|' -f2- "$ACTIVE_FILE")
}

header(){
clear
load_active
echo "DO Manager"
}
