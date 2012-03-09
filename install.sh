#!/bin/bash
# Author: Spencer Rathbun
# Date: 2012-03-09
# Summary:  Install init script with default options. Must be run as root to function properly.

if (( $UID )); then
	echo "You must have root privileges to run this script" 
	exit 1
fi

cp ffox-tmpfs /etc/init.d/
chmod 775 /etc/init.d/ffox-tmpfs
cp firefox-tmpfs.conf /etc/
update-rc.d ffox-tmpfs defaults
echo 'ramdrive      /tmp      tmpfs          size=1G             0 0' >> /etc/fstab
crontab -l > tmpcron
echo '30 * * * * service ffox-tmpfs save' >> tmpcron
crontab tmpcron && rm tmpcron
