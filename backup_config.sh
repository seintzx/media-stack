#!/bin/bash

# Source and destination folders
SRC="${HOME}/media-stack/config"
DEST="${HOME}/media-backup"

# Timestamp for this backup
TS=$(date +'%Y%m%d_%H%M%S')

# Create backup
rsync -a --delete "$SRC/" "$DEST/backup_$TS/"

# Keep only the last 7 backups
ls -1dt $DEST/backup_* | tail -n +8 | xargs rm -rf

