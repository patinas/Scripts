#!/bin/bash
sudo chmod +x *.sh
gstatus=`git status --porcelain`

if [ ${#gstatus} -ne 0 ]
then

    git add --all
    git commit -m "$gstatus"

	git pull
    git push

fi

cat <<EOF | crontab -
*/30 * * * * /root/post_install_linux/update.sh
*/5 * * * * /root/config/sync.sh
*/3 * * * * /root/config/upload.sh
EOF
