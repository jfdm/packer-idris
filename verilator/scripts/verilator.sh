set -eux

# Adapted from https://verilator.org/guide/latest/install.html

echo '# Installing Verilator from Source'

echo "## Prerequisites"

apk add -U git perl python3 make autoconf g++ flex bison ccache flex-dev numactl
apk add -U perl-doc

echo "## Fetching Repository"

git clone https://github.com/verilator/verilator

echo "## Checking out stable"

unset VERILATOR_ROOT

cd verilator

git pull

git checkout stable

echo "## Configuring Build"

autoconf
./configure

echo "## Building"

make -j "$(nproc)"

echo "## Installing"

make install

echo "## Cleaning up"

cd ../

rm -rf verilator

echo "## Checking Installation"

cd "$HOME"

which verilator
verilator --version


# -- [ EOF ]
