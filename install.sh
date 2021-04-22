#!/bin/bash -e

echo "================= Adding some global settings ==================="
mkdir -p "$HOME/.ssh/"
mv /config "$HOME/.ssh/"
mv /90forceyes /etc/apt/apt.conf.d/
touch "$HOME/.ssh/known_hosts"
mkdir -p /etc/drydock

echo "================= Installing basic packages ================"
apt-get update
apt-get install -y \
sudo \
software-properties-common \
wget \
unzip \
curl \
openssh-client \
ftp \
gettext \
smbclient \
mercurial \
software-properties-common \
git

apt-add-repository universe
apt-get update

echo "================= Installing Python packages =================="
apt-get install -q -y \
python3-dev \
python3-pip

pip3 install -q virtualenv==16.7.0
pip3 install -q pyOpenSSL==19.1.0

export JQ_VERSION=1.*
echo "================= Adding JQ $JQ_VERSION ========================="
apt-get install -y -q jq="$JQ_VERSION"

echo "================= Installing CLIs packages ======================"
wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | sudo apt-key add -;
echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" | sudo tee -a /etc/apt/sources.list;
apt-get update;
apt-get install -y jfrog-cli;


