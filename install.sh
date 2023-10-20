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

# Function to purge the nvim directory
purge_nvim_directory() {
    if [ -d "$destination_dir" ]; then
        rm -r "$destination_dir"
        echo "Purged '$destination_dir'"
    fi
}

# Function to move all files except the "install" file
move_files_except_install() {
    for file in "$source_dir"/*; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "install" ]; then
            mv "$file" "$destination_dir"
        fi
    done
}

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

# Move all files except the "install" file to the destination directory
move_files_except_install

# Remove the current directory
rm -r "$source_dir"

echo "All files except 'install' have been moved to '$destination_dir' and the current directory has been removed."

