set -eux

echo 'Obtaining Idris2 0.3.0'

cd $HOME

wget https://github.com/idris-lang/Idris2/archive/v0.3.0.tar.gz

tar -zxvf v0.3.0.tar.gz
cd $HOME/Idris2-0.3.0/

echo 'Making Idris2'
make bootstrap-build SCHEME=chez install #test

# Need to change for Idris v0.3.1
# make bootstrap SCHEME=chez install #test

cat >>$HOME/.bashrc <<'EOF'
export PATH=$HOME/.idris2/bin:$PATH
EOF

cd $HOME

source $HOME/.bashrc

echo 'Checking installation'

which idris2
idris2 --prefix
idris2 --paths
idris2 --libdir

echo $PATH
