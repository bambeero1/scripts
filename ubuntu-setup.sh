#!/bin/bash


cd $HOME

sudo apt-get update -y
sudo apt-get upgrade -y


# ---------Setup dev stuff---------

# Basic dev stuff
echo "Installing basic stuff..." &&
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common git -y ||
echo "Could not install basic stuff WTF"


# zsh
echo "Installing zsh..." &&
sudo apt-get install zsh git-core -y ||
echo "Could not install zsh"


# Oh my zsh
echo "Installing Oh my ZSH..." &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ||
echo "Could not install Oh my ZSH"

# Python 3.6
echo "Installing Python 3.6..." &&
sudo add-apt-repository -u ppa:jonathonf/python-3.6 -y &&
sudo apt-get install python3.6 python-dev python-pip python3-dev python3-pip virtualenv -y ||
echo "Could not install Python 3.6"
python3.6 -m pip install --upgrade pip

# Open JDK 9
echo "Installing OpenJDK 9..." &&
sudo apt-get install openjdk-9-jdk -y ||
echo "Could not install OpenJDK 9"

#Docker
echo "Installing Docker CE..." &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository -u "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y &&
sudo apt-get install docker-ce -y ||
echo "Could not install Docker CE"

# Docker compose
echo "Installing Docker Compose..." &&
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose ||
echo "Could not install Docker Compose"

#Docker compose autocomplete for ZSH
echo "Installing Docker Compose autocomplete for Oh my ZSH..." &&
mkdir -p $HOME/.zsh/completion &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
echo "fpath=(~/.zsh/completion $fpath)" >> $HOME/.zshrc &&
echo "autoload -Uz compinit && compinit -i" >> $HOME/.zshrc ||
echo "Could not install Docker Compose autocomplete for Oh my ZSH"


sudo apt-get -y install build-essential libssl-dev

# Execute nvm installation script
echo "# Executing nvm installation script"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# Set up nvm environment without restarting the shell
export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && . "${NVM_DIR}/bash_completion"

# Install node
echo "# Installing nodeJS"
nvm install 8
nvm use 8

sudo apt install snapd

sudo snap install go --classic


# Print installation details for user
echo ''
echo 'Installation completed, versions installed are:'
echo ''
echo -n 'Node:           '
node --version
echo -n 'npm:            '
npm --version
echo -n 'Docker:         '
docker --version
echo -n 'Docker Compose: '
docker-compose --version
echo -n 'Python:         '
python -V
echo -n 'Python3:         '
python3.6 -V
echo -n 'pip:         '
pip -V
echo -n 'go:         '
go --version
