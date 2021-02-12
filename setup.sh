#!/bin/sh

exists() {
    if hash $1 2>/dev/null; then
        return 0
    else 
        echo "$1 doesn't exist"
        return 1
    fi
}

exists curl
has_curl=$?

exists git
has_git=$?

exist zsh
has_zsh=$?


#check required lib exists
if [ $has_curl ] && [ $has_git ] && [ $has_zsh ]; then
    echo "All required libb exists...."
else 
    echo "One ore more of curl, git, zsh is not installed. Exiting..."
    exit 1
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "ob-my-zsh already installed"
else 
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#copy powerlevel10k zsh-theme
curl -LSso ~/.oh-my-zsh/themes/powerlevel10k.zsh-theme https://raw.githubusercontent.com/romkatv/powerlevel10k/master/powerlevel10k.zsh-theme
