#!/bin/bash

echo "... -> checking for a current neovim installation"

# Check if Neovim is installed
if command -v nvim &> /dev/null; then
    echo "... -> Neovim is already installed"
    echo "_____"
    echo "     | Exiting w/o installing neovim"
    echo "     v"
    return 
fi

    # Determine the package manager based on your OS (apt, pacman, brew, etc.)
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Linux-based systems (e.g., Ubuntu)
        if command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install neovim -y
        elif command -v pacman &> /dev/null; then
            sudo pacman -S neovim --noconfirm
        else
            echo "!!! Unsupported package manager. Please install Neovim manually. !!!"
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS (Homebrew)
        if command -v brew &> /dev/null; then
            brew install neovim
        else
            echo "!!! Homebrew is required for Neovim installation on macOS. Please install Homebrew and then Neovim manually. !!!"
            exit 1
        fi
    else
        echo "!!! Unsupported OS. Please install Neovim manually. !!!"
        exit 1
    fi

    echo "... -> Neovim has been installed."
    echo "_____"
    echo "     | Exiting, neovim install assumed success"
    echo "     v"
