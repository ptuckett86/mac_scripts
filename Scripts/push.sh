#!/bin/bash

branchname=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

git push origin $branchname $1
