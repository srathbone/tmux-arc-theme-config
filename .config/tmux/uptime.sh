#!/bin/bash

. "${0%/*}/colours.sh"

main() {
    local uptime
    uptime="$(cat /proc/uptime)"
    uptime="${uptime%%.*}"

    local minutes
    minutes="$(( uptime / 60 ))"
    printf "%d:%d\n" "$(( minutes / 60 ))" "$(( minutes % 60 ))"

    return 0;
}

main "$@"
