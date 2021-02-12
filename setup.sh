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

exists zsh
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
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" ~/.oh-my-zsh/custom/themes/powerlevel10k

#copy .zshrc
curl -LSso ~/.zshrc "https://raw.githubusercontent.com/tsengvn/config/main/.zshrc"

#copy p10k config
curl -LSso ~/.p10k.zsh "https://raw.githubusercontent.com/tsengvn/config/main/.p10k.zsh"