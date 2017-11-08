#!/bin/bash

$(i3status -c ~/.i3/i3status.conf) | while :
do
    read line
    echo "test" || exit 1
done
