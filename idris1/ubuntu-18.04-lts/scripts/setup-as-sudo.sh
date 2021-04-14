#!/bin/bash -eux
# [ ROOT ]
# A basic install script to install cabal and ghc.

# Add vagrant user to sudoers.
echo "idris-playground        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

apt update

# Upgrade all installed packages incl. kernel and kernel headers
apt-get -y upgrade linux-server linux-headers-server

# ensure the correct kernel headers are installed
apt-get -y install linux-headers-$(uname -r)

echo 'Begin Install'
echo 'Installing /latest/ version of Haskell that Idris tests with.'

add-apt-repository ppa:hvr/ghc --yes
apt update
apt upgrade --yes
apt install ghc-8.2.2 cabal-install-2.0 --yes

echo 'End Install'
