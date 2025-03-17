#!/bin/bash

function get_default_branch {
    branch_test="$(git show-ref refs/heads/master)"
    default_branch="none"

    if [ -z "$branch_test" ]; then
        default_branch="main"
    else
        default_branch="master"
    fi
}
