#!/bin/bash

echo "=============================================================="
echo "Welcome to MLSG's noob backup utility"
echo "=============================================================="

echo "=============================================================="
read -p "Please enter the file or directory to backup (NO RELATIVE PATH): " SRC_DIR
if [ ! -d "$SRC_DIR" ]
then
	echo "=============================================================="
	echo "$SRC_DIR is not a valid directory"
	echo "=============================================================="
	echo "Closing now..."
	sleep 1s
	exit 1
fi


read -p "Please enter the backup destination: " DEST_DIR

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Generate a timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

BACKUP_NAME="$DEST_DIR/backup_$TIMESTAMP.tar.gz"

tar -czvf "$BACKUP_NAME" "$SRC_DIR"

echo "=============================================================="
echo "Backup created successfully: $BACKUP_NAME"
