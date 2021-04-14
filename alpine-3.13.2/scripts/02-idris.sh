set -eux

echo 'Utilities to help interact with Idris source code.'
apk add -U tmux mg rlwrap

echo 'Installing Deps for Idris'
apk add -U libffi libffi-dev chez-scheme

echo 'Obtaining Idris2 0.3.0'

cd $HOME

wget https://github.com/idris-lang/Idris2/archive/v0.3.0.tar.gz

tar -zxvf v0.3.0.tar.gz
cd $HOME/Idris2-0.3.0/

echo 'Making Idris2'
make bootstrap SCHEME=chez install #test

echo 'export $PATH=$HOME/.idris2/bin:$PATH' >> $HOME/.bash_profile

cd $HOME

source $HOME/.bash_profile

echo 'Checking installation'

which idris2
idris2 --prefix
idris2 --paths
idris2 --libdir

echo $PATH
