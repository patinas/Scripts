#!/bin/sh


(crontab -l 2>/dev/null; echo "*/30 * * * * /bin/sh /root/post_install_linux/update.sh >> /root/update.log 2>&1") | crontab -
