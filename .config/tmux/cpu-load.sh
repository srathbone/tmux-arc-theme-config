#!/bin/bash

pwd="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
. "$pwd/colours.sh"

main() {
    total_cpu_cores="$(nproc --all)"
    cpu_load="$(awk '{ print $1 }' < /proc/loadavg)"
    cpu_load_percent="$(awk '{printf("%i",$1/$2*100)}' <<<" ${cpu_load} ${total_cpu_cores} ")"

    if [[ "${cpu_load_percent}" -lt 50 ]]; then
        print_green_string "${cpu_load}"
    elif [[ "${cpu_load_percent}" -lt 80 ]]; then
        print_yellow_string "${cpu_load}"
    else
        print_red_string "${cpu_load}"
    fi

}

main "$@"
