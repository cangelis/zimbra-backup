#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Restore file path is required"
    exit 1
fi

BACKUP_CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_FILE=`realpath $1`
source "$BACKUP_CWD/config"
service zimbra stop
cd "$ZIMBRA_PATH"
rm -rf "$ZIMBRA_PATH/*"
tar zxf "$BACKUP_FILE" .
bash "$BACKUP_CWD/hardlinks.sh" restore . .hardlinks
service zimbra start
