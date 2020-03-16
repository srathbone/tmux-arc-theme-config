#!/bin/bash

main() {
    local uptime
    uptime="$(cat /proc/uptime)"
    uptime="${uptime%%.*}"

    local minutes
    minutes="$(( uptime / 60 ))"
    printf "%d:%02d\n" "$(( minutes / 60 ))" "$(( minutes % 60 ))"

    return 0;
}

main "$@"
