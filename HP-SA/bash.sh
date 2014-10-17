

mkdir /tmp/bash 2>> /dev/null
mount.nfs 182.192.0.32:/tmp/bash /tmp/bash


yum install -y bash
yum install -y openssl
yum info bash > /tmp/bash/summary/$HOSTNAME-$(date '+%Y_%m_%d')-bash.log
yum info openssl >> /tmp/bash/summary/$HOSTNAME-$(date '+%Y_%m_%d')-openssl.log

umount.nfs 182.192.0.32:/tmp/bash
rmdir /tmp/bash