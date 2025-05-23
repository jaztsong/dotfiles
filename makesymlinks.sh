#!/bin/bash

############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old            # old dotfiles backup directory
files="bashrc vimrc vim zshrc wezterm.lua oh-my-zsh tmux.conf p10k.zsh"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh() {
    # Test to see if zshell is installed
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        # Clone oh-my-zsh repository from GitHub only if it isn't already present
        if [[ ! -d $dir/oh-my-zsh/ ]]; then
            git clone http://github.com/robbyrussell/oh-my-zsh.git
        fi
        # Set the default shell to zsh if it isn't currently set to zsh
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
            chsh -s $(which zsh)
        fi
    else
        # If zsh isn't installed, get the platform of the current machine
        platform=$(uname)
        # If the platform is Linux, try an apt-get to install zsh and then recurse
        if [[ $platform == 'Linux' ]]; then
            if [[ -f /etc/redhat-release ]]; then
                sudo yum install zsh
                install_zsh
            fi
            if [[ -f /etc/debian_version ]]; then
                sudo apt-get install zsh
                install_zsh
            fi
        # If the platform is OS X, tell the user to install zsh
        elif [[ $platform == 'Darwin' ]]; then
            echo "Please install zsh, then re-run this script!"
            exit
        fi
    fi

    # Install powerline
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    # Install autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # Install autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # Install eza
    git clone https://github.com/z-shell/zsh-eza.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-eza

    install_font
}

install_font() {
    platform=$(uname)
    if [[ $platform == 'Darwin' ]]; then
        if ! brew list --cask font-meslo-lg-nerd-font >/dev/null 2>&1; then
            echo "Installing MesloLGS NF font..."
            brew tap homebrew/cask-fonts
            brew install --cask font-meslo-lg-nerd-font
            echo "Font installed. Please restart your terminal to apply the changes."
        else
            echo "MesloLGS NF font is already installed."
        fi
    elif [[ $platform == 'Linux' ]]; then
        echo "Please manually install MesloLGS NF font on Linux"
        echo "Download from: https://github.com/romkatv/powerlevel10k#manual-font-installation"
    fi
}

install_zsh
