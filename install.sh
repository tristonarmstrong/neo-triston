#!/bin/bash

# Check if the OS is Windows and exit with a message
if [ -n "$OS" ]; then
    echo "Ew... Windows? I just puked a little..."
    exit 1
fi

# Define the source directory as the current directory
source_dir="$(pwd)"

# Define the destination directory
destination_dir="$HOME/.config/nvim"

# Check if the destination directory exists and create it if it doesn't
# Check for command line arguments
while getopts "p" opt; do
    case "$opt" in
        p) # Purge the nvim directory
            purge_nvim_directory
            exit 0
            ;;
        \?)
            echo "Usage: $0 [-p] (optional -p flag to purge the nvim directory)"
            exit 1
            ;;
    esac
done
# Create the destination directory if it doesn't exist
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

echo "All files except 'install' have been moved to '$destination_dir' and the current directory has been removed."

