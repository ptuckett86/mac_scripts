#!/bin/bash

mono=$(pwd)

echo "Installing node modules"
yarn install
echo "Starting frontend"
echo $mono
if [[ $mono == *"GitPrime"* ]] then
    echo "Starting monolith"
    yarn build:dev
else
    echo "Starting BC"
    yarn start
fi
