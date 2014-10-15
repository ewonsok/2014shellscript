#<This Version is 1 to>


mkdir /tmp/real_checklist 2>> /dev/null


echo "------------------------------------------------" > /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "Server name : $HOSTNAME" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt

echo "1.1 Are there any unnecessary accounts in use?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "A. Are there accounts unnecessary in use or baseless?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "B. Are there any unnecessary accounts not used?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "C. Are accounts that granted unnecessary shell removed and prohibited to grant shell?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "1.2 Are there any shared accounts that are being used?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "A. Are shared accounts being used?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# cat /etc/passwd" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
cat /etc/passwd >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt



echo "3.5 Is IP and port access control in operation on system level?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "A. Is IP and port "access control" in operation?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# cat /etc/hosts.deny" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
cat /etc/hosts.deny >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# cat /etc/hosts.allow" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
cat /etc/hosts.allow >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt


echo "4.1 Is audit policy applied?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "A. Are the server access logs saved?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# ls -al /var/log/wtmp* /var/log/btmp*" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
ls -al /var/log/wtmp* /var/log/btmp* >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt


echo "B. Are privilege escalation logs saved?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# ls -al /var/log/secure (or /var/log/sulog)" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
ls -al /var/log/secure >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt 2>> /dev/null
ls -al /var/log/sulog >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt 2>> /dev/null
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt


echo "C. Are server operating event logs saved?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# ls -al /var/log/messages" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
ls -al /var/log/messages >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt


echo "4.2 Is log storage duration appropriate?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "B. Are privilege escalation logs stored for one year or more?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# head -1 /var/log/secure (or /var/log/sulog)" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
head -1 /var/log/secure >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt 2>> /dev/null
head -1 /var/log/sulog >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt 2>> /dev/null
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt





echo "5.3 Security settings for used services is set properly?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "D. Block access to external internet on server?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# ping 112.106.149.100 -w 4" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
ping 112.106.149.100 -w 4 >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt


echo "5.5 Management about unnecessary or suspicious data is performed?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "A. Were unnecessary setuid/setgid files deleted?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# find / -user root -type f -perm -4000 -o -perm -2000 -exec ls -lg {} \;" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
find / -user root -type f -perm -4000 -o -perm -2000 -exec ls -lg {} \; >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt 2>> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt


echo "5.7 Is transfer level encryption of important data applied?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "A. Is encrypted transmission about services for server connection performed?" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# cat /etc/xinetd.d/telnet" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
cat /etc/xinetd.d/telnet >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt 2>> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# chkconfig --list | grep -i telnet" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
chkconfig --list | grep -i telnet >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt 2>> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "[$HOSTNAME]# chkconfig --list | grep -i ftp" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
chkconfig --list | grep -i ftp >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt 2>> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt
echo "------------------------------------------------" >> /tmp/real_checklist/$HOSTNAME-$(date '+%Y_%m_%d').txt



mkdir /mnt/real_checklist1 2>> /dev/null
mount.nfs 182.192.0.32:/tmp/checklist_collector /mnt/real_checklist1/
cp /tmp/real_checklist/* /mnt/real_checklist1/
umount.nfs 182.192.0.32:/tmp/checklist_collector
rmdir /mnt/real_checklist1

