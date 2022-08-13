#!/usr/bin/env bash

# Import credentials form config file
. /opt/tg-alerts/creds.conf
URL="https://api.telegram.org/bot${KEY}/sendMessage"
DATE="$(date "+%d %b %Y %H:%M")"

SRV_HOSTNAME="example.com"
SRV_IP="0.0.0.0"

if [ -n "$SSH_CLIENT" ]; then
        CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')
        IPINFO="https://ipinfo.io/${CLIENT_IP}"

        TEXT=$(printf '\U26A0')
        TEXT="${TEXT}Connection from *${CLIENT_IP}* as ${SUDO_USER} on *${SRV_HOSTNAME}* (*${SRV_IP}*)
        Date: ${DATE}
        More information: [${IPINFO}](${IPINFO})"

        curl -s -d "chat_id=${USERID}&text=${TEXT}&disable_web_page_preview=true&parse_mode=markdown" $URL > /dev/null
#else
#       echo "no ssh client"
fi
