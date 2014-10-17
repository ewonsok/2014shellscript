mkdir /etc/yum.repos.d/bak 2>> /dev/null
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak/ 2>> /dev/null


mkdir /tmp/repo 2>> /dev/null
mount.nfs 182.192.0.32:/tmp/repo /tmp/repo


uname -r | grep el6 2>> /dev/null
if [ $? -eq 0 ] #if this version is el6
        then
              cp /tmp/repo/el6.repo /etc/yum.repos.d/el6.repo
        else
              cp /tmp/repo/el5.repo /etc/yum.repos.d/el5.repo

fi

yum clean all
yum repolist > /tmp/repo/summary/$HOSTNAME-$(date '+%Y_%m_%d').log

umount.nfs 182.192.0.32:/tmp/repo
rmdir /tmp/repo