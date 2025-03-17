# Useful Scripts

## Setup

### Clone the repo into your home directory:
``` sh
cd $HOME && git clone git@github.com:ptuckett86/mac_scripts.git
```

### Mac Setup instructions:
This will add a new ssh key to your github so you can clone repos and push/pull changes.

1. Create a github token here (you'll need it to add a new ssh key):
https://github.com/settings/tokens

2. Download the add ssh key script from here:
[https://github.com/ptuckett86/mac_scripts/Scripts/add_ssh_key.sh](https://github.com/ptuckett86/mac_scripts/blob/master/Scripts/add_ssh_key.sh)

3. Run the script:
``` sh
source add_ssh_key.sh
```

4. Next run the mac_setup.sh script:
``` sh
cd $HOME/Scripts && source mac_setup.sh
```

### If you want to add aliases for the scripts in this file run this:
Add aliases to your `.zshrc`
``` sh
cd $HOME/Scripts && source add_aliases.sh
```

List of aliases:
``` sh
reload # reloads your .zshrc profile
checkout-default-branch # checkout main or master for current repo
change-flow-password # prompts a flow password change (requires gitprime containers to be running)
dcu # docker compose up, starts up the current repo containers
dcu-gql # docker compose up for graphql repos
dcd # docker compose down, shuts down current repo containers
dcd-all # shuts down all containers
prune-all # prunes containers, after requires new docker compose build
direnv-clean # removes and cleans current repo direnv environment
push # pushes up current branch
force-push # pushes up current branch with --force-with-lease
force-sandbox # pushes current branch to sandbox
start-shell # start a docker shell
yarn-clean # cleans yarn cache
yarn-start # starts frontend
change-secrets # changes your db settings
tsh-tunnel # tunnels to a specific db
fundies # cds into flow-fundamentlas repo (assumes Repos directory)
mono # cds into GitPrime repo (assumes Repos directory)
tickets # cds into flow-tickets-delivery repo (assumes Repos directory)
```
