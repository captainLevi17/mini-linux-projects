#!/bin/bash

echo "=============================================================="
echo "Welcome to MLSG's noob restore utility"
echo "=============================================================="


read -p "Please enter the backup directory: " BACKUP_DIR

# Check if the backup directory exists
if [ ! -d "$BACKUP_DIR" ]
then
echo "Error: Backup directory '$BACKUP_DIR' not found!"
exit 1
fi

echo "=== Available Backups ==="

# Load all .tar.gz archives into an array

backups=("$BACKUP_DIR"/*.tar.gz)

# Check if any backups actually exist

if [ ${#backups[@]} -eq 0 ] || [ ! -e "${backups[0]}" ]
then
echo "=============================================================="

echo "No backup archives found in $BACKUP_DIR."
exit 1
fi

# Use Bash 'select' to create an interactive menu
echo "=============================================================="

PS3="Select a backup number to restore: "
select backup_file in "${backups[@]}"
do
	if [ -n "$backup_file" ]
	then
		echo "You selected: $backup_file"
		break
	else
		echo "Invalid selection. Please choose a valid number."
	fi
done

# Prompt user for a destination directory
echo "=============================================================="

read -p "Enter the destination directory for restoration [default: restore_test]: " DEST_DIR

# User parameter expansion to set a default value if input is emty
DEST_DIR="${DEST_DIR:-restore_test}"

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"
echo "=============================================================="

echo "Restoring '$backup_file' to '$DEST_DIR/'..."
tar -xzvf "$backup_file" -C "$DEST_DIR"
echo "=============================================================="

echo "Restore completed successfully!"
