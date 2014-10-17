
mkdir /tmp/real_checklist 2>> /dev/null

echo "------------------------------------------------" > /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt
echo "Server name : $HOSTNAME" >> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt


echo "5.9 Is system setting for malware infection defense applied?" >> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt
echo "A. Unowned files exist?" >> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# find / -nouser -o -nogroup" >> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt
find / -nouser -o -nogroup >> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt 2>> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt


mkdir /tmp/tmpdir 2>> /dev/null
mount.nfs 182.192.0.32:/tmp/checklist_collector /tmp/tmpdir/
cat /tmp/real_checklist/5.9.nouser-$(date '+%Y_%m_%d').txt >> /tmp/tmpdir/5.9.nouser-$(date '+%Y_%m_%d').txt
umount.nfs 182.192.0.32:/tmp/checklist_collector
rmdir /tmp/tmpdir







