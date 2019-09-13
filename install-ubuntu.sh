install_docker(){
    # Install Docker
    sudo apt-get update
    sudo apt-get -yy install apt-transport-https ca-certificates curl software-properties-common wget pwgen
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update && sudo apt-get -y install docker-ce

    # Install Docker Compose
    sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    # Allow current user to run Docker commands
    sudo usermod -aG docker $USER
}
install_dev(){
    # Install Docker
    sudo apt-get update
    sudo apt-get -yy install git python-dev python-pip python3-dev python3-pip gcc g++ make cmake virtualenv
    sudo python3 -m pip install --upgrade pip
    sudo python2 -m pip install --upgrade pip
}

install_docker
install_dev
