#!/usr/bin/env bash

setup() {
    true
}

@test 'itCanParseUptime' {
    cat() {
        echo '8871.30 60807.27';
    }

    export -f cat
    run bash uptime.sh

    echo "$output"

    [[ $status -eq 0 ]]
    [[ $output = '2:27' ]]
}

@test 'itCanParseAnUptimeSmallerThanOneHour' {
    cat() {
        echo '360.30 60807.27';
    }

    export -f cat
    run bash uptime.sh

    echo "$output"

    [[ $status -eq 0 ]]
    [[ $output = '0:06' ]]
}

@test 'itCanParseAnUptimeLargerThanOneDay' {
    cat() {
        echo '99222.30 60807.27';
    }

    export -f cat
    run bash uptime.sh

    echo "$output"

    [[ $status -eq 0 ]]
    [[ $output = '27:33' ]]
}
