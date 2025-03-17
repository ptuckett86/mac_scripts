#!/bin/bash

name='gitprime-flow-1'
container=$(docker ps -q -f status=running -f name=^/${name}$)

if [[ ! $container ]]; then
    echo "Woah there, you don't have your monolith container running"
    echo "You must have the monolith backend container running to do this"
    return
fi

if [[ -z $EMAIL ]]; then
    echo "Looks like you don't have your EMAIL environment variable set"
    echo -n "What is your email? "
    read email
else
    email=$EMAIL
fi

docker exec -it ${container} python manage.py changepassword ${EMAIL}
