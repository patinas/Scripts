#!/bin/sh


(crontab -l 2>/dev/null; echo "*/30 * * * * /usr/bin/sh /root/post_install_linux/update.sh") | crontab -
