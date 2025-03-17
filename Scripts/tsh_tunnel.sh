#!/bin/bash

PS3="Which db do you want to tunnel to? "
container=()
while read -r line; do
    container+=("$line")
done < $HOME/Scripts/environments.txt
select opt in "${container[@]}"
break

env=`echo $opt | cut -d ":" -f 1`
port=`echo $opt | cut -d ":" -f 2`
echo "Tunneling to ${env}:${port}"
tsh ssh -L ${port}:localhost:${port} sandbox-db-01
