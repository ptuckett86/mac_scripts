#!/bin/bash

source $HOME/Scripts/get_default_branch.sh

get_default_branch

git stash 
git branch -d $default_branch 
git fetch origin $default_branch
git checkout $default_branch
git pull
git pull origin $default_branch
