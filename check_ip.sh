#!/bin/bash

file_path="/home/mikey/Documents/ip_address.txt"

password=$1
ip_address=$(wget -qO- http://ipecho.net/plain)

touch $file_path

old_ip_address=$(cat $file_path)

if [[ $old_ip_address == $ip_address ]]; then
  exit 0
else
  echo "$ip_address" > $file_path

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
  --mail-from 'camminecraftserver@gmail.com' \
  --mail-rcpt 'ziegltrum@gmail.com' \
  --mail-rcpt 'mzandtheraspberrypi@gmail.com' \
  --mail-rcpt 'cameron.cn@yagowap.com' \
  --mail-rcpt 'Hughhigin@gmail.com' \
  --user "camminecraftserver@gmail.com:$password" \
    -T <(echo -e "From: camminecraftserver@gmail.com\nTo: ziegltrum@gmail.com,cameron.cn@yagowap.com,Hughhigin@gmail.com\nSubject: MC IP: $ip_address\n\nHello,\nThe ip address for Cam's minecraft server is $ip_address today. Have a nice day.")
fi
