#!/bin/bash
cd /root/scripts/
sudo chmod +x *.sh
gstatus=`git status --porcelain`

if [ ${#gstatus} -ne 0 ]
then
	git pull
    git add .
    git commit -q -m "$gstatus"
    git push -q

fi
