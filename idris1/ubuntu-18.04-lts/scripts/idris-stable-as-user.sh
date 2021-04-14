#!/bin/bash -eux
# A basic install script to install stable Idris from cabal

echo 'Begin Install'
echo 'Installing /latest/ stable version of Idris'

export PATH=/opt/ghc/8.2.2/bin/:/opt/cabal/2.0/bin/:$PATH
export PATH=$HOME/.cabal/bin/:$PATH

cabal update
cabal install idris 

echo 'End Install'

echo 'Augmenting PATH'

echo '# PATH configured for Idris' >> /home/idris-playground/.bashrc
echo 'export PATH=/opt/ghc/8.2.2/bin/:/opt/cabal/2.0/bin/:$PATH' >> /home/idris-playground/.bashrc
echo 'export PATH=$HOME/.cabal/bin/:$PATH' >> /home/idris-playground/.bashrc

source .bashrc

echo $PATH

echo 'Checking installation'
which idris
idris --info

echo 'Finished'
