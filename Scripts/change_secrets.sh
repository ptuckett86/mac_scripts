#!/bin/bash

if [[ ! -f "$HOME/Scripts/secrets.txt" ]]; then
    echo "Oops I can't find your secrets.txt file, did you accidentally delete it?"
    return
fi

if [[ -z $EMAIL ]]; then
    echo "Looks like you don't have your EMAIL environment variable set"
    echo -n "What is your email? "
    read email
else
    email=$EMAIL
fi

source $HOME/Scripts/get_environment.sh

get_environment

name="flow_sandbox"
if [[ "$env" == "staging" ]]; then
    name="flow_staging"
fi

# pass=$DB_PASSWORD
# echo -n "Do you want to change your db password (y, n)? "
# read choice
# if [[ "$choice" == "y" ]]; then
#     echo -n "What is the new password? "
#     read pass
# fi


while read -r line; do
    key=`echo $line | cut -d "=" -f 1`
    value=`echo $line | cut -d "=" -f 2`
    # if [[ "$key" == "DB_PASSWORD" ]]; then
    #     ESCAPED_KEY=$(printf %q "$value")
    #     # sed -i "s/\($ESCAPED_KEY *= *\).*/\1/d" $HOME/Scripts/secrets.txt
    #     sed -i "" -e "s/${key}=$ESCAPED_KEY/${key}=${pass}/" $HOME/Scripts/secrets.txt
    if [[ "$key" == "DB_PORT" ]]; then
        sed -i "" "s/$key=$value/$key=$port/" $HOME/Scripts/secrets.txt
    elif [[ "$key" == "DB_NAME" ]]; then
        sed -i "" "s/$key=$value/$key=$name/" $HOME/Scripts/secrets.txt
    elif [[ "$key" == "EMAIL" ]]; then
        sed -i "" "s/$key=$value/$key=$email/" $HOME/Scripts/secrets.txt
    fi
done < $HOME/Scripts/secrets.txt
echo "DB environment changed in ~/Scripts/secrets.txt"

echo "Applying changes to ~/.zshrc"
source $HOME/Scripts/add_secrets.sh
