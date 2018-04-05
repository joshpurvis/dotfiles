#!/bin/sh

set -e

CHROMIUM_TEMP=~/tmp/chromium
rm -Rf $CHROMIUM_TEMP
mkdir -p $CHROMIUM_TEMP

chromium \
    --disable \
    --disable-translate \
    --disable-infobars \
    --disable-suggestions-service \
    --disable-save-password-bubble \
    --disk-cache-dir=$CHROMIUM_TEMP/cache/ \
    --user-data-dir=$CHROMIUM_TEMP/user_data/ \
    --kiosk "http://google.com" \ 
    --app &
sleep 5
xdotool search --sync --onlyvisible --class "chromium" key F11
