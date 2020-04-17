#!/bin/bash -eux
# A basic install script to install stable Idris from cabal

cd /tmp/
tar -zxvf /tmp/code.tar.gz

cd $HOME
mv /tmp/code $HOME/example

idris --info
echo 'Finished'
