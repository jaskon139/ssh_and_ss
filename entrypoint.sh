#!/bin/sh

# generate host keys if not present
ssh-keygen -A

echo "root:password" | chpasswd

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"
