#!/bin/bash

pwd="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
. "$pwd/colours.sh"

main() {
    uptime="$(uptime | awk '{ print $3 }' | tr -d ',')"

    if [[ "${uptime}" =~ .*:.* ]]; then
        echo "${uptime}"
    else
        if [[ "${uptime}" =~ ^.$ ]]; then
           echo "0:0${uptime}"
        else
           echo "0:${uptime}"
        fi
    fi
}

main "$@"
