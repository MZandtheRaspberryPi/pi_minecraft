#!/bin/bash

file_path="/home/<user>/miner/ip_address.txt"

password=$1
ip_address=$(wget -qO- http://ipecho.net/plain)

touch $file_path

old_ip_address=$(cat $file_path)

if [[ $old_ip_address == $ip_address ]]; then
  exit 0
else
  echo "$ip_address" > $file_path

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
  --mail-from 'fake_from@gmail.com' \
  --mail-rcpt 'fake_to_1@gmail.com' \
  --mail-rcpt 'fake_to_2@gmail.com' \
  --mail-rcpt 'fake_to_3@gmail.com' \
  --mail-rcpt 'fake_to_4@gmail.com' \
  --user "fake_from@gmail.com:$password" \
    -T <(echo -e "From: fake_from@gmail.com\nTo: fake_to_1@gmail.com,fake_to_2@gmail.com,fake_to_3@gmail.com\nSubject: MC IP: $ip_address\n\nHello,\nThe ip address for Cam's minecraft server is $ip_address today. Have a nice day.")
fi
