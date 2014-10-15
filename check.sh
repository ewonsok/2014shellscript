

#<This Version is html.v6 2014-06-11 from Wonsok>


df | awk '{if ($5 ~ "/SYSLOG-NW"){print} else {next}}' > /var/www/html/txt/$(date '+%Y_%m_%d').txt
df -h | awk '{if ($5 ~ "/SYSLOG-NW"){print} else {next}}' > /var/www/html/txt/$(date '+%Y_%m_%d')_gb.txt



today_size=`(cat /var/www/html/txt/$(date '+%Y_%m_%d').txt | awk '{print $2}')`
yesterday_size=`(cat /var/www/html/txt/$(date -d -1days '+%Y_%m_%d').txt | awk '{print $2}')`

today_size_gb=`(cat /var/www/html/txt/$(date '+%Y_%m_%d')_gb.txt | awk '{print $2}')`
yesterday_size_gb=`(cat /var/www/html/txt/$(date -d -1days '+%Y_%m_%d')_gb.txt | awk '{print $2}')`


today_used_percent=`(cat /var/www/html/txt/$(date '+%Y_%m_%d').txt | awk '{print $4}')`
yesterday_used_percent=`(cat /var/www/html/txt/$(date -d -1days '+%Y_%m_%d').txt | awk '{print $4}')`


increased_size_b=`expr $today_size - $yesterday_size`
increased_size_gb=`expr $increased_size_b / 1048576`




echo "

<html>
<table>
       <table border="1">
       <caption><B>Disk Size Check</B></caption>


       <thead>
         <tr>
           <th>Date</th><th>Size(Tb)</th><th>Size(byte)</th><th>use%</th><th>Increased</th>
         </tr>
       </thead>



       <tbody>
         <tr>
          <td>$(date -d -1days '+%m/%d')</td><td>$yesterday_size_gb</td><td>$yesterday_size b</td><td>$yesterday_used_percent</td><td> </td>
         </tr>
         <tr>
          <td>$(date '+%m/%d')</td><td>$today_size_gb</td><td>$today_size b</td><td>$today_used_percent</td><td>$increased_size_gb GB</td>
         </tr>
       </tbody>

</table>
<br></br>

" > /var/www/html/$(date '+%Y_%m_%d').html







echo "


<table>
       <table border="1">
       <caption><B>Log event</B></caption>



       <thead>
         <tr>
           <th>Model</th><th>filename</th><th>date</th><th>size</th>
         </tr>
       </thead>

       <tbody>

         <tr><td>Palo Alto 2050</td>
" >> /var/www/html/$(date '+%Y_%m_%d').html

(ls -kl /SYSLOG-NW/fw_log/pa2050/PA-2050_traffic_$(date '+%Y_%m_%d').csv | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html


echo "<tr><td>Palo Alto 5050</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/pa5050/PA-5050_traffic_$(date '+%Y_%m_%d').csv | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html

echo "<tr><td>SVR_C_BK_FW</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/SVR_C_BK/SVR_C_BK_$(date '+%Y_%m_%d').csv | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html



echo "<tr><td>Secui</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/secuilog/act_admitted_$(date -d -1days '+%Y%m%d').txt | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/secuilog/act_denied_$(date -d -1days '+%Y%m%d').txt | awk '{print "<tr><td></td><td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html



echo "<tr><td>SDS-Mgmt</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/SDS-Mgmt/$(date -d -1days '+%Y-%m-%d')*.log | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr><td></td>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html
echo "</tr>" >> /var/www/html/$(date '+%Y_%m_%d').html


echo "<tr><td>SDSRND-Mgmt</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/SDSRND-Mgmt/$(date -d -1days '+%Y-%m-%d')*.log | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr><td></td>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html
echo "</tr>" >> /var/www/html/$(date '+%Y_%m_%d').html


echo "<tr><td>SEC-Mgmt</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/SEC-Mgmt/$(date -d -1days '+%Y-%m-%d')*.log | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr><td></td>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html
echo "</tr>" >> /var/www/html/$(date '+%Y_%m_%d').html

echo "<tr><td>SECRND-Mgmt</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/SECRND-Mgmt/$(date -d -1days '+%Y-%m-%d')*.log | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr><td></td>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html
echo "</tr>" >> /var/www/html/$(date '+%Y_%m_%d').html

echo "<tr><td>SCARD-Mgmt</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/SCARD-Mgmt/$(date -d -1days '+%Y-%m-%d')*.log | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr><td></td>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html
echo "</tr>" >> /var/www/html/$(date '+%Y_%m_%d').html

echo "<tr><td>SLIFE2-Mgmt</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/SLIFE2-Mgmt/$(date -d -1days '+%Y-%m-%d')*.log | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr><td></td>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html
echo "</tr>" >> /var/www/html/$(date '+%Y_%m_%d').html

echo "<tr><td>SETC-Mgmt</td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(ls -kl /SYSLOG-NW/fw_log/SETC-Mgmt/$(date -d -1days '+%Y-%m-%d')*.log | awk '{print "<td>"$9"</td><td>"$6"/"$7"  "$8"</td><td>  "$5"k</td></tr><td></td>"}') >> /var/www/html/$(date '+%Y_%m_%d').html 2>> /var/www/html/$(date '+%Y_%m_%d').html
echo "</tr>" >> /var/www/html/$(date '+%Y_%m_%d').html


echo "
       </tbody>
</table>
<br></br>

" >> /var/www/html/$(date '+%Y_%m_%d').html










echo "

<table>
       <table border="1">
       <caption><B>Final Log Data</B></caption>


       <thead>
         <tr>
           <th>Model</th><th>Data</th>
         </tr>
       </thead>


       <tbody>
         <tr>
          <td>PA2020</td>
          <td>
" >> /var/www/html/$(date '+%Y_%m_%d').html

(tail -1 /SYSLOG-NW/fw_log/pa2050/PA-2050_traffic_$(date '+%Y_%m_%d').csv) >> /var/www/html/$(date '+%Y_%m_%d').html

echo "</td></tr>
      <tr><td>PA5050</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html

(tail -1 /SYSLOG-NW/fw_log/pa5050/PA-5050_traffic_$(date '+%Y_%m_%d').csv) >> /var/www/html/$(date '+%Y_%m_%d').html


echo "</td></tr>
      <tr><td>SVR_C_BK_FW</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html

(tail -1 /SYSLOG-NW/fw_log/SVR_C_BK/SVR_C_BK_$(date '+%Y_%m_%d').csv) >> /var/www/html/$(date '+%Y_%m_%d').html


echo "</td></tr>
      <tr><td>Secui_admit</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html

(tail -1 /SYSLOG-NW/fw_log/secuilog/act_admitted_$(date -d -1days '+%Y%m%d').txt) >> /var/www/html/$(date '+%Y_%m_%d').html

echo "</td></tr>
      <tr><td>Secui_deny</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html

(tail -1 /SYSLOG-NW/fw_log/secuilog/act_denied_$(date -d -1days '+%Y%m%d').txt) >> /var/www/html/$(date '+%Y_%m_%d').html



echo "</td></tr>
      <tr><td>SDS-Mgmt</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html
(tail -1 /SYSLOG-NW/fw_log/SDS-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log) >> /var/www/html/$(date '+%Y_%m_%d').html


echo "</td></tr>
      <tr><td>SDSRND-Mgmt</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html
(tail -1 /SYSLOG-NW/fw_log/SDSRND-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log) >> /var/www/html/$(date '+%Y_%m_%d').html


echo "</td></tr>
      <tr><td>SEC-Mgmt</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html
(tail -1 /SYSLOG-NW/fw_log/SEC-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log) >> /var/www/html/$(date '+%Y_%m_%d').html


echo "</td></tr>
      <tr><td>SECRND-Mgmt</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html
(tail -1 /SYSLOG-NW/fw_log/SECRND-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log) >> /var/www/html/$(date '+%Y_%m_%d').html

echo "</td></tr><tr><td>SCARD-Mgmt-VFW</td><td>" >> /var/www/html/$(date '+%Y_%m_%d').html
(tail -1 /SYSLOG-NW/fw_log/SCARD-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log) >> /var/www/html/$(date '+%Y_%m_%d').html
#(tail -50000 /SYSLOG-NW/fw_log/SCARD-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log | sort -r | grep -m 1 VFW,) >> /var/www/html/$(date '+%Y_%m_%d').html

#echo "</td></tr><tr><td>SCARD-Mgmt-ED</td><td>" >> /var/www/html/$(date '+%Y_%m_%d').html
#(tail -50000 /SYSLOG-NW/fw_log/SCARD-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log | sort -r | grep -m 1 ED,) >> /var/www/html/$(date '+%Y_%m_%d').html

#echo "</td></tr><tr><td>SCARD-Mgmt-ED2</td><td>" >> /var/www/html/$(date '+%Y_%m_%d').html
#(tail -50000 /SYSLOG-NW/fw_log/SCARD-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log | sort -r | grep -m 1 ED2,) >> /var/www/html/$(date '+%Y_%m_%d').html

#echo "</td></tr><tr><td>SCARD-Mgmt-ED3</td><td>" >> /var/www/html/$(date '+%Y_%m_%d').html
#(tail -50000 /SYSLOG-NW/fw_log/SCARD-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log | sort -r | grep -m 1 ED3,) >> /var/www/html/$(date '+%Y_%m_%d').html


echo "</td></tr>
      <tr><td>SLIFE2-Mgmt</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html
(tail -1 /SYSLOG-NW/fw_log/SLIFE2-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log) >> /var/www/html/$(date '+%Y_%m_%d').html

echo "</td></tr>
      <tr><td>SETC-Mgmt</td><td>
" >> /var/www/html/$(date '+%Y_%m_%d').html
(tail -1 /SYSLOG-NW/fw_log/SETC-Mgmt/$(date -d -1days '+%Y-%m-%d')_235*.log) >> /var/www/html/$(date '+%Y_%m_%d').html

echo "</td></tr></tbody></table>

</html>
" >> /var/www/html/$(date '+%Y_%m_%d').html


cp /var/www/html/$(date '+%Y_%m_%d').html /var/www/html/today.html

mail -r fw.sbc@samsung.com -s "$(echo -e "["$(date '+%Y-%m-%d')"]""Firewall Log Record\nContent-Type: text/html")" -S smtp=smtp.samsung.com smook.kang@partner.samsung.com < /var/www/html/today.html
mail -r fw.sbc@samsung.com -s "$(echo -e "["$(date '+%Y-%m-%d')"]""Firewall Log Record\nContent-Type: text/html")" -S smtp=smtp.samsung.com won_sok.lee@samsung.com < /var/www/html/today.html
mail -r fw.sbc@samsung.com -s "$(echo -e "["$(date '+%Y-%m-%d')"]""Firewall Log Record\nContent-Type: text/html")" -S smtp=smtp.samsung.com jinwoong33.kim@samsung.com < /var/www/html/today.html

mail -r fw.sbc@samsung.com -s "$(echo -e "["$(date '+%Y-%m-%d')"]""Firewall Status Check\nContent-Type: text/plain")" -S smtp=smtp.samsung.com smook.kang@partner.samsung.com < /script/checkstat/$(date '+%Y-%m-%d').txt
mail -r fw.sbc@samsung.com -s "$(echo -e "["$(date '+%Y-%m-%d')"]""Firewall Status Check\nContent-Type: text/plain")" -S smtp=smtp.samsung.com won_sok.lee@samsung.com < /script/checkstat/$(date '+%Y-%m-%d').txt
mail -r fw.sbc@samsung.com -s "$(echo -e "["$(date '+%Y-%m-%d')"]""Firewall Status Check\nContent-Type: text/plain")" -S smtp=smtp.samsung.com jinwoong33.kim@samsung.com < /script/checkstat/$(date '+%Y-%m-%d').txt


mail -r fw.sbc@samsung.com -s "$(echo -e "["$(date '+%Y-%m-%d')"]""Firewall Log Record\nContent-Type: text/html")" -S smtp=smtp.samsung.com hyunchul.oh@samsung.com < /var/www/html/today.html
mail -r fw.sbc@samsung.com -s "$(echo -e "["$(date '+%Y-%m-%d')"]""Firewall Status Check\nContent-Type: text/plain")" -S smtp=smtp.samsung.com hyunchul.oh@samsung.com < /script/checkstat/$(date '+%Y-%m-%d').txt

