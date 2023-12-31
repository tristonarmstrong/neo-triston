#!/bin/bash

# Check if the OS is Windows and exit with a message
if [ -n "$OS" ]; then
    echo "!!! Ew... Windows? I just puked a little... !!!"
    exit 1
fi

# Import and call the Neovim installation script
source "$(dirname "$0")/lib/check_nvim_installed.sh"

# Continue with the rest of your installation steps
echo "-> Continuing with the config installation..."

# Define the source directory as the current directory
source_dir="$(pwd)"

# Define the destination directory
destination_dir="$HOME/.config/nvim"

# Check for command line argument flags
purge_flag=false
backup_flag=false


# The `purge_nvim_directory` function plays a crucial role in managing a specific destination directory. This function is part of a larger script and carries out the following steps in a human-readable manner:
# 1. **Initial Directory Check**: The function begins by checking whether the destination directory, represented by the variable "$destination_dir," exists. It does this by employing the `[ -d ]` conditional statement, a test used to ascertain whether the given path corresponds to an existing directory.
# 2. **Purging Process**: If the function confirms the existence of the destination directory, it proceeds to purge its contents. The purging process is executed using the `rm` command with the `-rf` options. These options together ensure the complete removal of all files and directories inside the destination directory.
# 3. **Notification Issuance**: After successfully purging the destination directory, the function emits a message to the console. This message informs the user that the purging process has been carried out and specifies the directory that has been purged - in this case, "$destination_dir."
# 4. **Final Operation Steps**: The function finalizes its operation, ensuring that it does not attempt to purge the directory if it does not exist. This design allows the function to gracefully handle the scenario where the destination directory is not present.
# In summary, the `purge_nvim_directory` function is responsible for cleansing the specified destination directory of all its contents. It verifies the existence of the directory, removes everything inside it, and communicates the successful completion of the purging process to the user. This function is a vital component in managing and resetting the state of the destination directory as needed.
purge_nvim_directory() {
    if [ -d "$destination_dir" ]; then
        rm -rf "$destination_dir"/*
        echo "-> Purged '$destination_dir'"
    fi
}


# The enhanced `create_backup` function plays a vital role within a larger script, responsible for creating a timestamped backup of the existing 'nvim' configuration directory. With precision, this function ensures that the 'nvim.bak' directory is not inadvertently moved into itself.
# A comprehensive overview of its functionality is as follows:
# 1. **Directory Existence Check**: The function initiates by checking for the existence of the destination directory, represented by the variable "$destination_dir." This initial verification step ensures that creating a backup is a valid and meaningful operation.
# 2. **Timestamp Generation**: Upon confirming the existence of the destination directory, the script proceeds to generate a timestamp using the `date` command. The timestamp is formatted as "mm-dd-yyyy-hh-mm-ss" and becomes an integral part of the backup directory's name.
# 3. **Backup Directory Creation**: The function then assembles the name of the backup directory by combining 'nvim.bak' with the generated timestamp. This creates a uniquely named directory for each backup operation. If the backup directory does not already exist, the function takes care to create it using the `mkdir` command.
# 4. **Dotglob Option Activation**: To include hidden files and folders while working with glob patterns, the script temporarily enables the 'dotglob' option using the `shopt` command. This ensures that hidden configuration files are also included in the backup.
# 5. **File Movement**: With the backup directory established and the 'dotglob' option in effect, the function employs the `mv` command to systematically move all files and directories from the destination directory into the uniquely named backup directory. This is done with precision, excluding the 'nvim.bak' directory itself from the list of items to be moved.
# 6. **Completion Message**: To maintain user transparency and convey the success of the operation, the function emits a message to the console. This message confirms the creation of a backup of the destination directory, with the timestamped backup directory name.
# 7. **Dotglob Option Reset**: After the backup operation is concluded, the script diligently resets the 'dotglob' option to its default state. This ensures that hidden files and folders are not included in future file operations by default.
# In summary, the enhanced `create_backup` function excels in creating timestamped backups of the destination directory, safeguarding against the inadvertent movement of the 'nvim.bak' directory into itself. It ensures that all relevant configuration files and directories, including hidden ones, are included in the backup. The function further provides clear and informative notifications to users, maintaining transparency throughout the script's execution.
create_backup() {
  if [ -d "$destination_dir" ]; then
    current_time=$(date +'%m-%d-%Y-%H-%M-%S')
    backup_dir="$destination_dir.bak$current_time"
    if [ ! -d "$backup_dir" ]; then
      mkdir -p "$backup_dir"
    fi

    # Ensure that we don't move the 'nvim.bak' directory into itself
    shopt -s dotglob # To include hidden files and folders
    mv "$destination_dir"/* "$backup_dir"
    shopt -u dotglob # Reset the dotglob option

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
move_files_except_a_few() {
	# Move all files and folders except the ".git" directory and "install.sh" file
	find "$source_dir" -mindepth 1 -maxdepth 1 ! -name ".git" ! -name "install.sh" ! -name "lib" -exec mv {} "$destination_dir" \;
}


# This function, check_and_create_directory, serves the purpose of checking if a specific destination directory exists and creating it if it doesn't. It operates within the context of a larger script.
# It takes into account two directories, $destination_dir and $HOME/.config, and performs the following steps:
# 1. The function starts by checking if the destination directory, represented by the variable "$destination_dir," exists. It does so by using the `[-d]` conditional statement to test if it is a directory.
# 2. If the destination directory does not exist, the function proceeds to the next step.
# 3. It then checks if another directory, "$HOME/.config," exists, using the same `[-d]` conditional statement. This directory is typically the parent directory for configuration files.
# 4. If "$HOME/.config" does exist, the function creates the destination directory "$destination_dir" using the `mkdir` command along with the `-p` option, which ensures the parent directories are created as needed.
# 5. If, however, "$HOME/.config" does not exist, it prints a message indicating that the configuration directory is missing. The message includes a suggestion to create the directory manually.
# 6. Finally, if the configuration directory cannot be created, the function exits with an error code (1) to signal that something went wrong.
# In summary, this function's purpose is to ensure that the destination directory for configuration files exists, creating it if necessary, while also checking for the existence of the parent configuration directory.
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

# The `handle_b_opt` function serves as a critical component within a larger script, responsible for managing specific operations when the `-b` command line option is utilized. This function carries out a series of actions in a human-readable manner:
# 1. **Backup Creation**: The function begins by initiating the creation of a backup for the destination directory. To accomplish this, it calls upon the `create_backup` function, ensuring that the contents of the destination directory are securely duplicated for safekeeping.
# 2. **Flag Assignment**: Following the successful creation of the backup, the function sets a flag, `backup_flag`, to the value `true`. This flag acts as an indicator that a backup operation has been executed and can be used to track the script's progress and actions.
# 3. **Default Handling**: The function proceeds to call another function, `handle_default_opt`, which manages default operations related to the script. This ensures that essential default tasks are executed, even when the `-b` option is in use.
# 4. **Notification**: To provide clarity and feedback to the user, the function emits a message to the console. This message indicates that all files in the destination directory, except the 'install' file, have been relocated to the designated destination directory. It also informs the user that a backup has been successfully created, contributing to data security and preservation.
# In essence, the `handle_b_opt` function is designed to handle operations related to the creation of a backup when the `-b` option is selected. It orchestrates the backup generation process, flags the operation's status, manages default operations, and communicates the results to the user, thereby ensuring a clear and transparent execution of the script.
handle_b_opt() {
  create_backup
  handle_default_opt
  echo "-> All files except 'install' have been moved to '$destination_dir', and a backup has been created."
}
# The `handle_p_opt` function is a pivotal component of a larger script, responsible for managing specific actions when the `-p` command line option is utilized. This function executes a sequence of tasks in a manner that is easy to comprehend:
# 1. **Purge Operation**: The function initiates a purge operation for the destination directory using the `purge_nvim_directory` function. This operation involves the complete removal of all files and directories within the destination directory, effectively resetting its state to an empty state.
# 2. **Flag Assignment**: Following the successful execution of the purge operation, the function assigns a flag, `purge_flag`, the value `true`. This flag serves as an indicator that a purge operation has been carried out and can be used to track the script's progress and actions.
# 3. **Default Handling**: The function proceeds to call another function, `handle_default_opt`, which manages default operations related to the script. This ensures that essential default tasks are executed, even when the `-p` option is in use.
# 4. **Notification**: To provide transparency and feedback to the user, the function communicates a message to the console. This message confirms that all files in the destination directory, with the exception of the 'install' file, have been moved to the specified destination directory. It also states that any previous files have been completely obliterated during the purge operation.
# In summary, the `handle_p_opt` function is designed to handle operations related to purging the destination directory when the `-p` option is chosen. It orchestrates the purge process, flags the operation's status, manages default operations, and communicates the results to the user, ensuring a clear and straightforward execution of the script.
handle_p_opt() {
  purge_nvim_directory
  handle_default_opt 
  echo "-> All files except 'install' have been moved to '$destination_dir' and previous files have been obliterated"
}

# The `handle_default_opt` function is an essential component of a larger script, responsible for managing default operations. This function is designed to execute a set of tasks that are easy for humans to understand:
# 1. **Configuration Directory Verification**: The function commences by verifying the existence of the destination directory where configuration files are stored. It does so by calling the `check_and_create_directory` function, ensuring that the necessary directory structure is in place. If the directory does not exist, the function creates it to ensure the proper location for configuration files.
# 2. **File Relocation**: After confirming the presence of the destination directory, the function proceeds to move all files and directories from the current directory (the source directory) to the destination directory. This process is orchestrated by the `move_files_except_a_few` function, which ensures that the "install" file is not moved, preserving its role within the configuration.
# In summary, the `handle_default_opt` function is responsible for orchestrating two fundamental tasks: verifying the existence and creation of the destination directory for configuration files and moving all files and directories to this destination, excluding the "install" file. This function plays a critical role in setting up and maintaining the configuration directory, ensuring that configuration files are correctly placed and preserved for use.
handle_default_opt() {
  # check_and_create_directory
  check_and_create_directory

  # Move all files except the "install" file to the destination directory
  move_files_except_a_few
}

print_and_reject_opts(){
  echo "!! Error: -b and -p flags cannot be used at the same time."
  exit 1
}

# The command line option handling section of the script is responsible for interpreting user-specified options and executing corresponding actions. This is done in a manner that is clear and comprehensible:
# 1. **Option Interpretation**: The script employs the `getopts` command to interpret command line options. It expects two possible options: `-b` and `-p`. These options trigger specific actions when selected.
# 2. **Backup Option (-b)**: When the `-b` option is chosen, the script initiates the creation of a backup of the existing "nvim" directory. This action is facilitated by the `handle_b_opt` function. Importantly, it also verifies whether the `-p` (purge) option has been previously selected. If both the `-b` and `-p` options are chosen together, the script invokes the `print_and_reject_opts` function to reject and inform the user of the invalid combination.
# 3. **Purge Option (-p)**: When the `-p` option is selected, the script proceeds to purge the "nvim" directory. This operation is executed by the `handle_p_opt` function. Similar to the backup option, it also checks whether the `-b` (backup) option has been previously chosen. If the user attempts to combine both the `-b` and `-p` options, the script invokes the `print_and_reject_opts` function to reject the invalid combination and provide a message to the user.
# 4. **Option Clarification**: In the event that an invalid or unrecognized option is provided, the script outputs a message to the console. This message informs the user about the valid usage of the script, listing the available options and their purposes. It also guides the user on how to correctly employ the script.
# In summary, this section of the script manages the interpretation of command line options (-b and -p) and ensures that actions are executed in a logical and understandable manner. It also guards against the combination of incompatible options, maintaining user-friendly behavior throughout the script's execution.
while getopts "bp" opt; do
    case "${opt}" in
        b) # Create a backup of the existing nvim directory
            if [ "$purge_flag" = true ]; then
              print_and_reject_opts
            fi
            backup_flag=true
            ;;
        p) # Purge the nvim directory
            if [ "$backup_flag" = true ]; then
              print_and_reject_opts
            fi
            purge_flag=true
            ;;
        \?)
            echo "~~ Usage: $0 [-b] [-p] (optional -b flag to create a backup, -p flag to purge the nvim directory)"
            exit 1
            ;;
    esac
done

if [ "$backup_flag" = true ]; then
  handle_b_opt
fi

if [ "$purge_flag" = true ]; then
  handle_p_opt
fi

# This section of the script is dedicated to handling default behavior when no command line options are provided. It ensures that key tasks are executed in a clear and understandable manner:
# 1. **Option Verification**: The script first verifies whether any command line options have been provided by examining the value of `$OPTIND`. If `$OPTIND` equals 1, it means that no command line options were specified.
# 2. **Default Action**: When no command line options are detected, the script proceeds to execute the `handle_default_opt` function. This function manages the default operations of the script, which involve moving all files and directories from the current directory to the destination directory, while excluding the 'install' file.
# 3. **Notification**: To inform the user of the performed actions, the script emits a message to the console. This message affirms that all files in the current directory, except for the 'install' file, have been relocated to the specified destination directory.
# In summary, this section of the script ensures that default operations are executed when no specific command line options are provided. It offers clarity in its actions and provides user-friendly notifications to keep users informed of the script's activities.
if (( $OPTIND == 1 )); then
  handle_default_opt 
  echo "-> All files except 'install' have been moved to '$destination_dir'."
fi

echo " -> NOTE -> if you made a mistake, the .git is still here so feel free to run `git restore .` to restore your files"
