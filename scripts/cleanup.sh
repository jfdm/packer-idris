#!/bin/bash -eux

# delete all linux headers
dpkg --list | awk '{ print $2 }' | grep linux-headers | xargs apt-get -y purge

# this removes specific linux kernels, such as
# linux-image-3.11.0-15-generic but
# * keeps the current kernel
# * does not touch the virtual packages, e.g.'linux-image-generic', etc.
#
dpkg --list | awk '{ print $2 }' | grep 'linux-image-3.*-generic' | grep -v `uname -r` | xargs apt-get -y purge

# delete linux source
dpkg --list | awk '{ print $2 }' | grep linux-source | xargs apt-get -y purge


# Apt cleanup.
apt-get -y autoremove
apt-get -y clean
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?


# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
