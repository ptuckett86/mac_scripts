#!/bin/bash

if [[ ! -f "$HOME/Scripts/secrets.txt" ]]; then
    echo "Oops I can't find your secrets.txt file, did you accidentally delete it?"
    return
fi

echo "Reading secrets.txt file and updating .zshrc file"
while read -r line; do
    key=`echo $line | cut -d "=" -f 1`
    value=`echo $line | cut -d "=" -f 2`
    if grep -q "^export $key=" $HOME/.zshrc; then
        sed -i "" "s/^export $key=.*/export $key=$value/" $HOME/.zshrc
    else
        echo "export $key=$value" >> $HOME/.zshrc
    fi
done < $HOME/Scripts/secrets.txt

source $HOME/.zshrc
echo "Secrets updated"
