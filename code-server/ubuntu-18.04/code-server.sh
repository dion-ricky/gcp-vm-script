#! /bin/bash
set -x
set -eu

# Execute pre-install script
eval $1

# Update apt package index
# and install necessary packages
sudo apt-get -yq update
sudo apt-get -yq install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker's stable repo
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

# Install Docker engine
sudo apt-get -yq update
sudo apt-get -yq install docker-ce docker-ce-cli containerd.io

# Install code-server
# https://github.com/cdr/code-server
mkdir -p ~/.config
docker run -it --name code-server -p 0.0.0.0:8080:8080 \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  codercom/code-server:latest

# Execute post-install script
eval $2
