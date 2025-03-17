#!/bin/bash

echo "" >> $HOME/.zshrc
echo "# Script Aliases" >> $HOME/.zshrc
echo "alias ll='ls -la'" >> $HOME/.zshrc
echo "alias reload='source $HOME/.zshrc'" >> $HOME/.zshrc
echo "alias checkout-default-branch='source $HOME/Scripts/checkout_default_branch.sh'" >> $HOME/.zshrc
echo "alias change-flow-password='source $HOME/Scripts/change_flow_password.sh'" >> $HOME/.zshrc
echo "alias dcd='source $HOME/Scripts/dcd.sh'" >> $HOME/.zshrc
echo "alias dcu='source $HOME/Scripts/dcu.sh'" >> $HOME/.zshrc
echo "alias dcu-gql='source $HOME/Scripts/dcu_gql.sh'" >> $HOME/.zshrc
echo "alias dcd-all='source $HOME/Scripts/all_down.sh'" >> $HOME/.zshrc
echo "alias direnv-clean='source $HOME/Scripts/direnv_clean.sh'" >> $HOME/.zshrc
echo "alias prune-all-containers='source $HOME/Scripts/docker_clean.sh'" >> $HOME/.zshrc
echo "alias push='source $HOME/Scripts/push.sh'" >> $HOME/.zshrc
echo "alias force-push='source $HOME/Scripts/push.sh --force-with-lease'" >> $HOME/.zshrc
echo "alias force-sandbox='source $HOME/Scripts/force_sandbox.sh'" >> $HOME/.zshrc
echo "alias rm-screenshots='source $HOME/Scripts/rm_screenshots.sh'" >> $HOME/.zshrc
echo "alias start-shell='source $HOME/Scripts/start_shell.sh'" >> $HOME/.zshrc
echo "alias yarn-clean='source $HOME/Scripts/yarn_clean.sh'" >> $HOME/.zshrc
echo "alias yarn-start='source $HOME/Scripts/yarn_start.sh'" >> $HOME/.zshrc
echo "alias change-secrets='source $HOME/Scripts/change_secrets.sh'" >> $HOME/.zshrc
echo "alias tsh-login='tsh login --proxy pluralsight.teleport.sh --auth okta'" >> $HOME/.zshrc
echo "alias tsh-tunnel='source $HOME/Scripts/tsh_tunnel.sh'" >> $HOME/.zshrc
echo "" >> $HOME/.zshrc
echo "# Cd Aliases" >> $HOME/.zshrc
echo "alias fundies='cd $HOME/Repos/flow-fundamentals/'" >> $HOME/.zshrc
echo "alias mono='cd $HOME/Repos/GitPrime'" >> $HOME/.zshrc
echo "alias tickets='cd $HOME/Repos/flow-tickets-delivery/'" >> $HOME/.zshrc

source $HOME/.zshrc
