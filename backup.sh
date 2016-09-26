#!/bin/bash

BACKUP_CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BACKUP_CWD/config
service zimbra stop
cd $ZIMBRA_PATH
bash $BACKUP_CWD/hardlinks.sh scan . .hardlinks
tar -f $BACKUP_FOLDER/zimbra.tgz --preserve -zc .
service zimbra start
bash post_backup.sh
