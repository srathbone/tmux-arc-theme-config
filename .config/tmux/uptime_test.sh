#!/usr/bin/env bash

setup() {
    true
}

@test 'itCanParseUptime' {
    uptime() {
        echo ' 20:39:40 up  1:11,  1 user,  load average: 0.37, 0.42, 0.33';
    }

    export -f uptime
    run bash uptime.sh

    echo "$output"

    [[ $status -eq 0 ]]
    [[ $output = '1:11' ]]
}

@test 'itCanParseAnUptimeSmallerThanOneHour' {
    uptime() {
        echo ' 20:39:40 up 15 minutes,  1 user,  load average: 0.37, 0.42, 0.33';
    }

    export -f uptime
    run bash uptime.sh

    echo "$output"

    [[ $status -eq 0 ]]
    [[ $output = '0:15' ]]
}
