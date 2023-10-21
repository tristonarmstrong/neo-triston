#!/bin/bash

# Check if the OS is Windows and exit with a message
if [ -n "$OS" ]; then
    echo "!!! Ew... Windows? I just puked a little... !!!"
    exit 1
fi

# Define the source directory as the current directory
source_dir="$(pwd)"

# Define the destination directory
destination_dir="$HOME/.config/nvim"

# Check for command line argument flags
purge_flag=false
backup_flag=false


# Function to purge the nvim directory
purge_nvim_directory() {
    if [ -d "$destination_dir" ]; then
        rm -rf "$destination_dir"/*
        echo "-> Purged '$destination_dir'"
    fi
}

# Function to create a backup of the existing nvim directory by moving, not copying, so purge isnt necessary
create_backup() {
  if [ -d "$destination_dir" ]; then
    backup_dir="$destination_dir/nvim.bak"
    if [ ! -d "$backup_dir" ]; then
      mkdir "$backup_dir"
    fi
    mv "$destination_dir"/* "$backup_dir"
    echo "-> Created backup of '$destination_dir' in '$backup_dir'"
  fi
}

# Move all files and folders from the source directory to the destination directory,
# excluding the ".git" directory and the "install.sh" file.

# Using the `find` command to search for files and directories.
# Starting from the current directory, which is represented by `"$source_dir"`.
# Ensuring that we do not include the source directory itself with `-mindepth 1`.
# Restricting the search to only one level deep (no subdirectories) with `-maxdepth 1`.

# To exclude specific items:
# - `! -name ".git"` ensures that any item with the name ".git" (the Git version control directory) is excluded.
# - `! -name "install.sh"` excludes the file "install.sh" from being moved.

# Finally, `-exec mv {} "$destination_dir"` is used to execute the `mv` command to move the found items
# to the destination directory, which is specified by `"$destination_dir"`.
move_files_except_install() {
	# Move all files and folders except the ".git" directory and "install.sh" file
	find "$source_dir" -mindepth 1 -maxdepth 1 ! -name ".git" ! -name "install.sh" -exec mv {} "$destination_dir" \;
}

# Create the destination directory if it doesn't exist
check_and_create_directory(){
	if [ ! -d "$destination_dir" ]; then
    		if [ -d "$HOME/.config" ]; then
        		mkdir -p "$destination_dir"
    		else
        		echo "-> Config directory ($HOME/.config) does not exist. Please create it manually."
        		exit 1
    		fi
	fi
}


handle_b_opt() {
  create_backup
  backup_flag=true
  handle_default_opt
  echo "-> All files except 'install' have been moved to '$destination_dir', and a backup has been created."
}

handle_p_opt() {
  purge_nvim_directory
  purge_flag=true
  handle_default_opt 
  echo "-> All files except 'install' have been moved to '$destination_dir' and previous files have been obliterated"
}

handle_default_opt() {
  # check_and_create_directory
  check_and_create_directory

  # Move all files except the "install" file to the destination directory
  move_files_except_install
}

print_and_reject_opts(){
  echo "!! Error: -b and -p flags cannot be used at the same time."
  exit 1
}

# Check for command line arguments
while getopts "bp" opt; do
    case "${opt}" in
        b) # Create a backup of the existing nvim directory
            if [ "$purge_flag" = true ]; then
              print_and_reject_opts
            fi
            handle_b_opt
            ;;
        p) # Purge the nvim directory
            if [ "$backup_flag" = true ]; then
              print_and_reject_opts
            fi
            handle_p_opt
            ;;
        \?)
            echo "~~ Usage: $0 [-b] [-p] (optional -b flag to create a backup, -p flag to purge the nvim directory)"
            exit 1
            ;;
    esac
done

if (( $OPTIND == 1 )); then
  handle_default_opt 
  echo "-> All files except 'install' have been moved to '$destination_dir'."
fi

