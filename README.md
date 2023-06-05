#External IP address check

Hello all,
this is a small, but very useful bash script that will notify you, once your external IP addess has changed. It can be useful if you have dynamic IP address and multiple services exposed to the internet and you want to make sure they stay reachable.

Script IPchange_pub.sh will ordinarily check if the external IP address hasn't changed. If it did not, it will just save the current external IP to the file current_external_ip.txt.

If the IP address has changed, then it will send an email to your email address using swaks command and SMTP server from google. It will also save the new external IP address to the file.
I have added this script to crontab, to run  every hour.

0 * * * * /bin/bash /home/path_to_the_script/IPchange_pub.sh

Prerequisities:

1. You need to have swaks command installed (https://linux.die.net/man/1/swaks)

sudo apt install swaks -y

2. Set up a app password for your Google mail and make sure the SMTP settings match the script.

