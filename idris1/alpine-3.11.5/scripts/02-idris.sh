set -eux

# Utilities to help interact with Idris source code.
apk add tmux mg

# Idris
echo http://mirrors.dotsrc.org/alpine/edge/testing >>/etc/apk/repositories
apk add -U libffi libffi-dev idris idris-doc


echo 'Checking installation'

which idris
idris --info
