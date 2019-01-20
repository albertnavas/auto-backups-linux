#!/bin/bash
# Daily backup

DB_FILE="all-d-`date +%Y%m%d_%H%M%S`"
DB_BK_FOLDER="/backups/db/"
DB_BACKUP="$DB_BK_FOLDER$DB_FILE"

DB_USER="backups_user"
DB_PASSWD="xxxxxxx"

MEDIA_FILE="media-d-`date +%Y%m%d_%H%M%S`"
MEDIA_BACKUP="/backups/media/$MEDIA_FILE"

echo "Creating MySQL Dump"
mysqldump --all-databases -u $DB_USER -p$DB_PASSWD --lock-tables=false > $DB_BACKUP.sql

echo "Compressing database"
tar czvf $DB_BACKUP.tar.gz $DB_BACKUP.sql

echo "Delete dump file"
rm $DB_BACKUP.sql

echo "Backup media"
tar czvf $MEDIA_BACKUP.tar.gz /home/xxxx

echo "Remove old"
find /backups/media/ -name "*media-d-*" -atime +8 -type f -print -exec rm {} \;
find /backups/db/ -name "*all-d-*" -atime +8 -type f -print -exec rm {} \;