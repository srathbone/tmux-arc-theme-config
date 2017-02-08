#!/bin/bash

. ${0%/*}/colours.sh

main() {
    used_mem=`free -h | awk '/Mem:/ { print $3 }' | awk '{$1=$1};1'`
    total_mem=`free -h | awk '/Mem:/ { print $2 }'`
    percent_mem=`free | awk '/Mem/{printf("%i"), $3/$2*100}'`

    if [ ${percent_mem} -lt 30 ]; then
        print_green_string "${used_mem}/${total_mem}"
    elif [ ${percent_mem} -lt 70 ]; then
        print_yellow_string "${used_mem}/${total_mem}"
    else
        print_red_string "${used_mem}/${total_mem}"
    fi
}

main "$@"

