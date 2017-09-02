#!/usr/bin/env bash

set -e

dotfiles_dir=`cd "$(dirname "$0")" && pwd`

echo "Home directory is ${HOME}"
echo "Dotfiles directory is ${dotfiles_dir}"

if [[ $OSTYPE =~ darwin ]]; then
    echo "macOS detected"
    if [ -z "`which brew`" ]; then
        echo "Installing Homebrew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Homebrew is already installed"
    fi

    echo "Updating brew bundles..."
    brew bundle --file="${dotfiles_dir}/Brewfile"
fi

echo "Symlinking configs..."
for file in profile vimrc inputrc zshrc; do
    ln -sf "${dotfiles_dir}/${file}" "${HOME}/.${file}"
done
unset file

CURRENT_GIT_USER=`git config --global --get user.name || echo`
CURRENT_GIT_EMAIL=`git config --global --get user.email || echo`
CURRENT_GH_HOST=${GITHUB_HOST:-github.com}

echo "Configuring git..."
read -p "Enter your full name ($CURRENT_GIT_USER): " GIT_USER
read -p "Enter your e-mail ($CURRENT_GIT_EMAIL): " GIT_EMAIL
read -p "Enter your GitHub host ($CURRENT_GH_HOST): " GH_HOST

GIT_USER=${GIT_USER:-$CURRENT_GIT_USER}
GIT_EMAIL=${GIT_EMAIL:-$CURRENT_GIT_EMAIL}
GH_HOST=${GH_HOST:-$CURRENT_GH_HOST}

cp -f "${dotfiles_dir}/gitconfig.template" "${HOME}/.gitconfig"

git config --global user.name "${GIT_USER}"
git config --global user.email "${GIT_EMAIL}"

git config --global core.excludesfile "${dotfiles_dir}/global.gitignore"

cat >~/.extra <<EOL
export GITHUB_HOST="${GH_HOST}"
EOL

echo "Done. Reload your shell"
