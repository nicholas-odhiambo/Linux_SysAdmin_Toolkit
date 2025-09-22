#!/bin/bash
#Description: BackUp the home_dir to /backups

BACKUP_DIR="/backups"
SRC="/home"
DATE=$(date +%F_%H-%M-%S)
DEST="$BACKUP_DIR/home_backup_$DATE.tar.gz"

mkdir -p $BACK_DIR
tar -czf $DEST $SRC

echo "Backup completed: $DEST"
