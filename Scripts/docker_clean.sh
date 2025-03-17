#!/bin/bash

echo "Warning this will completely remove all your containers, you'll need to rebuild them all"
echo -n "Are you sure you still want to proceed? (y, n) "
read choice

if [[ "$choice" == "y" ]] then
    echo "Cleaning docker house"
    docker system prune --all --force --volumes
    docker image prune --all --force
fi
