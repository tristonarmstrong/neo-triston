#!/bin/bash

# Define the source and destination directories
source_dir=$(pwd)                  # Current directory
destination_dir="$HOME/.config/nvim"

# Check if the destination directory exists, and if not, create it
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

# Move all the files and directories from the current directory to the destination directory
mv "$source_dir"/* "$destination_dir"

echo "All files and directories from '$source_dir' have been moved to '$destination_dir'"

