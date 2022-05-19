#!/bin/sh
(crontab -l ; echo "*/30 * * * * /root/scripts/update.sh >/dev/null 2>&1")| crontab -
(crontab -l ; echo "*/30 * * * * /root/scripts/upload.sh >/dev/null 2>&1")| crontab -
(crontab -l ; echo "@reboot /root/scripts/download.sh >/dev/null 2>&1")| crontab -

chmod +x *.sh
