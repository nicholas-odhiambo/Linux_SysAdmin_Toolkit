#!/bin/bash
#Description: BackUp the home_dir to /backups

# backup with timestamps 

BACKUP_DIR="$HOME/backups"
SRC="/home"
DATE=$(date +%F_%H-%M-%S)
DEST="$BACKUP_DIR/home_backup_$DATE.tar.gz"

# Create the backup dir

mkdir -p  "$BACKUP_DIR"

## error handling

if tar --warning=no-file-changed  -czf "$DEST" "$SRC"; then
	echo "Backup completed: $DEST"
else
	echo "Backup failed!"
	exit 1
fi
