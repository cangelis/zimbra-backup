#!/bin/bash

BACKUP_CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BACKUP_CWD/config
service zimbra stop
cd $ZIMBRA_PATH
rm -rf $ZIMBRA_PATH/*
tar zxf $BACKUP_FOLDER/zimbra.tgz
bash $BACKUP_CWD/hardlinks.sh restore . .hardlinks
service zimbra start
