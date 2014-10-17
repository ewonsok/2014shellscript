mkdir /tmp/real_checklist 2>> /dev/null

echo "------------------------------------------------" > /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt
echo "Server name : $HOSTNAME" >> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt


echo "5.8 Are important documents on system managed?" >> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt
echo "A. Are important documents not related to the operation stored on server?" >> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# find / -name *.tar -o -name *.zip -o -name *.tgz -o -name *.gz -o -name *.bak" >> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt
find / -name "*.tar" -o -name "*.zip" -o -name "*.tgz" -o -name "*.gz" -o -name "*.bak" >> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt 2>> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt


mkdir /tmp/tmpdir 2>> /dev/null
mount.nfs 182.192.0.32:/tmp/checklist_collector /tmp/tmpdir/
cat /tmp/real_checklist/5.8.imp.doc-$(date '+%Y_%m_%d').txt >> /tmp/tmpdir/5.8.imp.doc-$(date '+%Y_%m_%d').txt
umount.nfs 182.192.0.32:/tmp/checklist_collector
rmdir /tmp/tmpdir