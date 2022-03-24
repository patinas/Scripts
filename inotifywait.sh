#!/bin/sh
sudo apt install inotify-tools -y
sudo apt install inotifywait -y

WATCHDIR=/root/post_install_linux/
TRIGGERCOMMAND=sh /root/post_install_linux/git_upload.sh

# Wait for something to happen...
while inotifywait -qq -r -e modify,close_write,create,delete,move,delete_self $WATCHDIR ; do
    # something happened, waiting for nothing to happen for 10 seconds
    while inotifywait -t 10 -qq -r -e modify,close_write,create,delete,move,delete_self $WATCHDIR ; do
        # more stuff happened, hold off a while longer
        sleep 1
    done
    WAITSTATUS=$?
    #echo waitstatus: $WAITSTATUS
    if [[ "$WAITSTATUS" == "1" ]] ; then
        echo inotifywait returned an error. Aborting.
        exit 1
    fi
    $TRIGGERCOMMAND
done

cd /root/dotfiles/
sudo +x *.sh
