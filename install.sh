#!/bin/bash

# Check if the OS is Windows and exit with a message
if [ -n "$OS" ]; then
    echo "Ew... Windows? I just puked a little..."
    exit 1
fi

# Define the source and destination directories
source_dir="$(pwd)"  # Current directory
destination_dir="$HOME/.config/nvim"

# Check if the destination directory exists and create it if it doesn't
if [ ! -d "$destination_dir" ]; then
    if [ -d "$HOME/.config" ]; then
        mkdir -p "$destination_dir"
    else
        echo "Config directory ($HOME/.config) does not exist. Please create it manually."
        exit 1
    fi
fi

# Move all the files and directories from the current directory to the destination directory
mv "$source_dir"/* "$destination_dir"

echo "All files and directories from '$source_dir' have been moved to '$destination_dir'"

