#!/bin/bash

function get_environment {
    PS3="Which db do you want to use? "
    container=()
    while read -r line; do
        container+=("$line")
    done < $HOME/Scripts/environments.txt
    select opt in "${container[@]}"
    break

    env=`echo $opt | cut -d ":" -f 1`
    port=`echo $opt | cut -d ":" -f 2`
}
