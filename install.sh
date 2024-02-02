# I do not, DO NOT recomment you to use this script. IF somehow, in anyway it did harm to you OR your system YOU and ONLY YOU are responsible.

#!/bin/bash

# Function to prompt for boolean input
prompt_bool() {
    # Check if the shell is interactive
    if [[ $- == *i* ]]; then
        while true; do
            read -p "$1 (y/n): " yn
            case $yn in
                [Yy]* ) return 0;;
                [Nn]* ) return 1;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    else
        # Default to 'no' in a non-interactive shell
        return 1
    fi
}

# Update and upgrade system
sudo apt-get update && sudo apt-get upgrade -y

# Install fish shell
if prompt_bool "Install fish shell?"; then
    sudo apt-get update
    sudo apt-get install fish -y
    chsh -s /usr/bin/fish
fi

# Install curl
if prompt_bool "Install curl?"; then
    sudo apt-get install curl -y
fi

# Remove current .config directory
if prompt_bool "Remove current .config directory?"; then
    rm -rf ~/.config
fi

# Install git
if prompt_bool "Install git?"; then
    brew install git -y
fi

# Clone the GitHub repository
if prompt_bool "Clone the GitHub repository?"; then
    git clone https://github.com/example/repo.git ~/
fi

# Install Homebrew
if prompt_bool "Install Homebrew?"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.config/fish/config.fish
fi


# Install Starship
if prompt_bool "Install Starship?"; then
    brew install starship
    echo 'starship init fish | source' >> ~/.config/fish/config.fish
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

# Install neovim
if prompt_bool "Install neovim?"; then
    brew install neovim -y
fi

# Install rust
if prompt_bool "Install rust?"; then
    brew install rust
fi