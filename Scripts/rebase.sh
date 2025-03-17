#!/bin/bash

source $HOME/Scripts/get_default_branch.sh
get_default_branch

branchname=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

git branch -d $default_branch
git fetch origin $default_branch
git checkout $default_branch
git pull origin $default_branch
git checkout $default_branch
git rebase $default_branch
