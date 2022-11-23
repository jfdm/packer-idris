set -eux

echo 'Obtaining Idris2 0.3.0'

apk add -U idris2



#wget https://github.com/idris-lang/Idris2/archive/refs/tags/v0.6.0.tar.gz

#tar -zxvf v0.6.0.tar.gz
#cd "$HOME/Idris2-0.6.0/"

echo 'Making Idris2'
#make bootstrap SCHEME=chez install install-docs #test

# Need to change for Idris v0.3.1
# make bootstrap SCHEME=chez install #test

#cat >>$HOME/.bashrc <<'EOF'
#export PATH=$HOME/.idris2/bin:$PATH
#EOF

#cd "$HOME"

#source "$HOME/.bashrc"

echo 'Checking installation'

which idris2
idris2 --prefix
idris2 --paths
idris2 --libdir

echo "$PATH"
