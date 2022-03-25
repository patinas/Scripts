#!/bin/sh
(crontab -l ; echo "*/30 * * * * /root/post_install_linux/update.sh >/dev/null 2>&1")| crontab -
chmod +x *.sh
