ssh-keygen -q -N '' -f $HOME/.ssh/id_rsa
SSH_KEY=$(cat $HOME/.ssh/id_rsa.pub)

echo -n "Paste your github api key "
read APIKEY

echo -n "Name your ssh key "
read TITLE

echo "Adding new ssh key to github"
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${APIKEY}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/keys \
  -d '{"title":"'"${TITLE}"'","key":"'"${SSH_KEY}"'"}'

echo -n "Do you want to install oh my zsh? (y, n) "
read CHOICE

if [[ "$CHOICE" == "y" ]] then
  echo "Installing oh my zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  source $HOME/.zshrc
fi
