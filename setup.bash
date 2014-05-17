#!/usr/bin/env bash

set -e

if [[ $OSTYPE =~ darwin ]]; then
    echo "OS X detected"
    if [ -n `which brew` ]; then
        echo "Installing Homebrew..."
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

        # brew bundle ~/configs/Brewfile
        # brew bundle ~/configs/Caskfile
    fi
fi

echo "Symlinking configs..."
for file in .{profile,gitconfig,vimrc,inputrc}; do
    ln -fs ~/configs/$file ~/$file
done
unset file

CURRENT_GIT_USER=`git config --global --get user.name`
CURRENT_GIT_EMAIL=`git config --global --get user.email`

echo "Configuring git..."
read -p "Enter your full name ($CURRENT_GIT_USER): " GIT_USER
read -p "Enter your e-mail ($CURRENT_GIT_EMAIL): " GIT_EMAIL

GIT_USER=${GIT_USER:-$CURRENT_GIT_USER}
GIT_EMAIL=${GIT_EMAIL:-$CURRENT_GIT_EMAIL}

echo "Sourcing new profile..."
source ~/.profile

cat >~/.extra <<EOL
GIT_AUTHOR_NAME="$GIT_USER"
GIT_COMMITTER_NAME="$GIT_USER"
git config --global user.name "$GIT_USER"

GIT_AUTHOR_EMAIL="$GIT_EMAIL"
GIT_COMMITTER_EMAIL="$GIT_EMAIL"
git config --global user.email "$GIT_EMAIL"
EOL

echo "Done."
