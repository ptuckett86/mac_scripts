#!/bin/bash

PS3='Which container do you want to start a shell in? '
container_names=($(docker ps -a --format '{{.Names}}'))
select opt in "${container_names[@]}"
break

docker exec -it $opt /bin/sh
