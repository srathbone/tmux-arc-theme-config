#!/bin/bash

colour_green="#73d216"
colour_yellow="#f7f72d"
colour_red="#fc4138"

print_green_string() {
    echo "#[fg=${colour_green}]$1"
}

print_yellow_string() {
    echo "#[fg=${colour_yellow}]$1"
}

print_red_string() {
    echo "#[fg=${colour_red}]$1"
}

