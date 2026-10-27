#!/bin/bash

if [ $# -gt 1 ]
then
echo "Sorry, only one directory at a time please"
echo "Exiting now..."
sleep 1s
exit
fi


echo "Welcome to MLSG's file organiser"
sleep 0.5s
if [ $1 ]
then
echo "I see you wanted to organise the $1 directory"
TARGET_DIR=$1
else
echo "Please type the directory to organise:"
read TARGET_DIR
fi

sleep 1.2s
echo "Let me just verify if the directory is valid..."
sleep 1s
if [ -d "$TARGET_DIR" ]
then
	echo "Great, let's get started!"
else
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
