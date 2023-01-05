#!/bin/bash -eux
# A basic script to check the code shipped in the code.tar.gz tarball

echo 'Setting up environment variables'

cat >>$HOME/.bashrc <<'EOF'
export PATH=$HOME/.nix-profile/bin:$PATH
EOF
source $HOME/.bashrc

echo 'Checking installation'

which idris2
idris2 --version
idris2 --prefix
idris2 --paths
idris2 --libdir

echo 'Extracting the code'

cd /tmp/
tar -zxvf /tmp/code.tar.gz

cd $HOME
mv /tmp/code $HOME/example

echo 'Checking the code'

cd $HOME/example
idris2 -c ListsWithLength.idr
cd $HOME

echo 'Finished'
