set -ux


rm -rf /var/cache/apk/*
rm -rf /etc/ssh/ssh_host_*

# zero the free disk space -- for better compression of the box file.
# NB prefer discard/trim (safer; faster) over creating a big zero filled file
#    (somewhat unsafe as it has to fill the entire disk, which might trigger
#    a disk (near) full alarm; slower; slightly better compression).
apk add util-linux
#if [ "$(lsblk -no DISC-GRAN $(findmnt -no SOURCE /) | awk '{print $1}')" != '0B' ]; then
#    fstrim -v /
#else
#    dd if=/dev/zero of=/EMPTY bs=1M || true && sync && rm -f /EMPTY && sync
#fi
