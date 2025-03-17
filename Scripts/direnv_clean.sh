#!/bin/bash

current=$(pwd)

echo 'Clearing direnv now'
rm -rf .direnv
poetry cache clear --all .
echo 'Reinitializing direnv'
cd ..
cd $current
poetry --version
which poetry
echo 'Poetry installing'
poetry install
echo 'YOU DID IT!'
