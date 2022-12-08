set -eux

echo 'Nix because that makes things easier...'

sudo apk add -U xz

# Fetch and execute `nix` install script
#
# We install nix by hand as the alpine installation is broken.
#
curl -L https://nixos.org/nix/install | sh

echo ". $HOME/.nix-profile/etc/profile.d/nix.sh" >> ~/.profile

. .profile

nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

echo 'Obtaining Idris2 0.6.0'
#
# We use nix, because why not...

# apk add -U idris2

nix-env -iA nixpkgs.idris2

# We keep this for when we need to build idris-head.

#wget https://github.com/idris-lang/Idris2/archive/refs/tags/v0.6.0.tar.gz

#tar -zxvf v0.6.0.tar.gz
#cd "$HOME/Idris2-0.6.0/"

# echo 'Making Idris2'
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

# -- [ EOF ]
