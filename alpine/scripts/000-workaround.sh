#!/bin/sh -x

/bin/cat >> /etc/ssh/sshd_config << __EOF__
HostKeyAlgorithms +ssh-rsa
PubKeyAcceptedAlgorithms +ssh-rsa
__EOF__

/sbin/service sshd reload
