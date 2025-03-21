echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew --version
brew update

export 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc

source $HOME/.zshrc

echo "Installing pyenv"
brew install pyenv

source $HOME/.zshrc

echo "Installing Python"
pyenv install 3.10.5
pyenv global 3.10.5

echo "Installing teleport"
curl -O https://cdn.teleport.dev/teleport-ent-16.4.7.pkg
sudo installer -pkg teleport-ent-16.4.7.pkg -target /
which teleport
rm teleport-ent-16.4.7.pkg

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "Installing Node"
nvm install 18.17.0

echo "Installing yarn"
brew install yarn

echo "Installing direnv"
brew install direnv

source $HOME/.zshrc

echo -n "What do you want to name your repos directory? "
read REPO

echo "Cloning repos"
mkdir $HOME/$REPO
cd $HOME/$REPO

git clone git@github.com:Git-Prime/GitPrime.git
git clone git@github.com:Git-Prime/flow-fundamentals.git
git clone git@github.com:Git-Prime/flow-tickets-delivery.git
git clone git@github.com:Git-Prime/flow-home.git
git clone git@github.com:Git-Prime/flow-work-log.git
git clone git@github.com:Git-Prime/flow-coaching.git
git clone git@github.com:Git-Prime/flmodels.git
git clone git@github.com:Git-Prime/flow-auth.git
git clone git@github.com:Git-Prime/flow-deployment-log.git

softwareupdate --install-rosetta

echo "Make sure to download the following programs:"
echo " - Docker Desktop https://docs.docker.com/desktop/setup/install/mac-install/"
echo " - VS Code https://code.visualstudio.com/"
echo " - iTerm (if you want it) https://iterm2.com/"
