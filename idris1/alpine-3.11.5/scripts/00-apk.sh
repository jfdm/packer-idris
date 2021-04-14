set -exu

# Upgrade packages
apk upgrade -U --available

source /etc/os-release

cat /etc/alpine-release

# Move to Edge for Idris and ffi
sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories
apk upgrade --update-cache --available

sync

cat /etc/alpine-release

# Add in essential utilities

apk add bash ca-certificates wget curl sudo

apk add attr dialog dialog-doc bash-doc bash-completion grep grep-doc

apk add nfs-utils

apk add util-linux util-linux-doc pciutils usbutils binutils findutils readline

apk add less less-doc curl curl-doc make

export PAGER=less
