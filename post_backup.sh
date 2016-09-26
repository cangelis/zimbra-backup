#!/bin/bash

# UPLOAD TO S3

cp $BACKUP_FOLDER/zimbra.tgz /s3/email
rm $BACKUP/zimbra.tgz
