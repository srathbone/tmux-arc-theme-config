#!/bin/bash

. ${0%/*}/colours.sh

main() {
    uptime=`uptime | awk '{ print $3}' | tr -d ','`

    if [[ ${uptime} =~ "*:*" ]]; then
        echo ${uptime}
    else
        echo "0:${uptime}"
    fi
}

main "$@"

