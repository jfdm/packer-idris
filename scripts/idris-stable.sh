#!/bin/bash -eux
# A basic install script to install stable Idris from cabal

# Add vagrant user to sudoers.
echo "idris-playground        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

echo 'Begin Install'
echo 'Installing /latest/ version of Haskell that Idris tests with.'

add-apt-repository ppa:hvr/ghc --yes
apt update
apt upgrade --yes
apt install ghc-8.2.2 cabal-install-2.0 --yes

echo 'End Install'

export PATH=/opt/ghc/8.2.2/bin/:/opt/cabal/2.0/bin/:$PATH

echo 'Begin Install'
echo 'Installing /latest/ stable version of Idris'

cabal update
cabal install idris

echo 'End Install'

echo 'Augmenting PATH'
echo '# PATH configured for Idris' >> /home/ecoop2019/.bashrc
echo 'export PATH=$HOME/.cabal/bin/:$PATH' >> /home/ecoop2019/.bashrc

source .bashrc

echo $PATH

echo 'Checking installation'
which idris
idris --info

echo 'Finished'

exit 0
