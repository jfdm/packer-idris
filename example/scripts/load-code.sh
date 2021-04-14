#!/bin/bash -eux
# A basic install script to install stable Idris from cabal

cd /tmp/
tar -zxvf /tmp/code.tar.gz

cd $HOME
mv /tmp/code $HOME/example

echo 'Checking installation'

which idris2
idris2 --prefix
idris2 --paths
idris2 --libdir

echo 'Finished'
