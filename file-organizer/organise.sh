#!/bin/bash

BLUE='\033[0;34m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color


if [ $# -gt 1 ]
then
echo "Sorry, only one directory at a time please"
echo "Exiting now..."
sleep 1s
exit
fi

echo "=============================================================="
echo "============= Welcome to MLSG's file organiser  ============="
echo "=============================================================="
sleep 0.5s
if [ $1 ]
then
echo "=============================================================="
echo "I see you wanted to organise the $1 directory"
TARGET_DIR=$1
else
echo "=============================================================="
echo "Please type the directory to organise (NO Relative path):"
read TARGET_DIR
fi

sleep 1.2s
echo "=============================================================="
echo "Let me just verify if the directory is valid..."
sleep 1s
if [ -d "$TARGET_DIR" ]
then
	echo "=============================================================="
	echo "Great, let's get started!"
else
	echo "=============================================================="
	echo "Sorry, not a valid directory. Exiting now..."
	sleep 1.5s
	exit
fi

for file in "$TARGET_DIR"/*
do
	if [ -f "$file" ]
	then
	filename=$(basename "$file")
	ext="${filename##*.}"
	# Create a directory for the extension if it doesn't exist
	mkdir -p "$TARGET_DIR/$ext"

	# Move the file into its respective extension folder
	mv "$file" "$TARGET_DIR/$ext/"
	echo "Moved $filename to $ext/"
	fi
done
