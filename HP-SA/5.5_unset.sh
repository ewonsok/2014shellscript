mkdir /tmp/real_checklist 2>> /dev/null

echo "------------------------------------------------" > /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt
echo "Server name : $HOSTNAME" >> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt


echo "5.5 Management about unnecessary or suspicious data is performed?" >> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt
echo "A. Were unnecessary setuid/setgid files deleted?" >> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# find / -user root -type f -perm -4000 -o -perm -2000 -exec ls -lg {} \;" >> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt
find / -user root -type f -perm -4000 -o -perm -2000 -exec ls -lg {} \; >> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt 2>> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt

mkdir /tmp/tmpdir 2>> /dev/null
mount.nfs 182.192.0.32:/tmp/checklist_collector /tmp/tmpdir/
cat /tmp/real_checklist/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt >> /tmp/tmpdir/5.5.unnec.setuid-$(date '+%Y_%m_%d').txt
umount.nfs 182.192.0.32:/tmp/checklist_collector
rmdir /tmp/tmpdir