#!/bin/bash

pwd="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
. "$pwd/colours.sh"

main() {
    local uptime
    uptime="$(cat /proc/uptime)"
    uptime="${uptime%%.*}"

    local minutes
    minutes="$(( uptime / 60 ))"
    printf "%02d:%02d\n" "$(( minutes / 60 ))" "$(( minutes % 60 ))"

    return 0;
}

main "$@"
