set -eux

# Setup Vagrant

# Add a timestamp for vagrant
date > /etc/vagrant.timestamp


adduser -D idris-playground
echo 'idris-playground:idris-playground' | chpasswd
adduser idris-playground wheel
echo '%wheel ALL=(ALL) NOPASSWD:ALL' >/etc/sudoers.d/wheel


# Install vagrant public key.
install -d -m 700 /home/idris-playground/.ssh
wget -qO /home/idris-playground/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 600 /home/idris-playground/.ssh/authorized_keys
chown -R idris-playground:idris-playground /home/idris-playground/.ssh

# install the VirtualBox Guest Additions.

apk add -U virtualbox-guest-additions #virtualbox-guest-modules-virt

rc-update add virtualbox-guest-additions default
echo vboxpci    >> /etc/modules
echo vboxdrv    >> /etc/modules
echo vboxnetflt >> /etc/modules

# disable the DNS reverse lookup on the SSH server. this stops it from
# trying to resolve the client IP address into a DNS domain name, which
# is kinda slow and does not normally work when running inside VB.
sed -i -E 's,#?(UseDNS\s+).+,\1no,' /etc/ssh/sshd_config

# use the up/down arrows to navigate the bash history.
# NB to get these codes, press ctrl+v then the key combination you want.
cat >>/etc/inputrc <<'EOF'
"\e[A": history-search-backward
"\e[B": history-search-forward
set show-all-if-ambiguous on
set completion-ignore-case on
EOF


echo 'Utilities to help interact with Idris source code.'
apk add -U tmux mg rlwrap

echo 'Installing Deps for Idris'
apk add -U libffi libffi-dev chez-scheme
