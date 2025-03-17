#!/bin/bash

echo "Clearing yarn cache"
yarn cache clean --all
echo "Removing node modules"
rm -rf node_modules
