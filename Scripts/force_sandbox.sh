#!/bin/bash

error="You selected a number that doesn't exist in the list, try again"
PS3='BC or Monolith? '
repo=('BC' 'Monolith')
select opt in "${repo[@]}"
break

if [[ "$opt" == "BC" ]] then
    branch="sandbox"
elif [[ "$opt" == "Monolith" ]] then
    PS3="Which branch? "
    container=()
    while read -r line; do
        if [[ "$line" =~ ^sandbox.*$ ]] then
            container+=("$line")
        fi
    done < $HOME/Scripts/environments.txt
    select opt in "${container[@]}"
    break

    if [[ -z "$opt" ]] then
        echo $error
        return
    fi
    branch=`echo $opt | cut -d ":" -f 1`
else
    echo $error
    return
fi

echo "You are going to force push to ${branch}"
current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
git branch -D ${branch}
git fetch origin ${branch}
git checkout ${branch}
git pull origin ${branch}
git pull
git checkout ${current_branch}
git push origin ${current_branch}:${branch} --force-with-lease
