#!/bin/bash

pwd="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
. "$pwd/colours.sh"

main() {
    local total_cpu_cores
    local cpu_load
    local cpu_load_percent
    total_cpu_cores="$(nproc --all)"
    cpu_load="$(cat /proc/loadavg)"
    cpu_load="${cpu_load%% *}"
    cpu_load_percent="$(awk '{printf("%i", ($1 * 100) / $2)}' <<<" ${cpu_load} ${total_cpu_cores} ")"

    if [[ "${cpu_load_percent}" -lt 50 ]]; then
        print_green_string "${cpu_load}"
    elif [[ "${cpu_load_percent}" -lt 80 ]]; then
        print_yellow_string "${cpu_load}"
    else
        print_red_string "${cpu_load}"
    fi

}

main "$@"
