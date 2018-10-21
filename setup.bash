#!/usr/bin/env bash

set -e

dotfiles_dir=`cd "$(dirname "$0")" && pwd`
extra_file="${HOME}/.extra"

echo "Home directory is ${HOME}"
echo "Dotfiles directory is ${dotfiles_dir}"

rm ${extra_file}

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

    if [ -z "`which mas`" ]; then
        cat "${dotfiles_dir}/Masfile"
        read -p "Install these apps from AppStore? " -n 1 -r
        echo
        if [[ ${REPLY} =~ ^[Yy]$ ]]; then
          brew bundle --file="${dotfiles_dir}/Masfile"
        fi
    else
        echo "Updating brew mas bundle..."
        brew bundle --file="${dotfiles_dir}/Masfile"
    fi
fi

if [[ $(uname -r) =~ Microsoft ]]; then
    source "${dotfiles_dir}/setup-wsl.bash"
fi

vundle_dir="${HOME}/.vim/bundle/Vundle.vim"
if [ ! -d "${vundle_dir}" ]; then
    read -p "Install vundle? " -n 1 -r
    echo
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
        echo "Installing Vundle..."
        mkdir -p "${vundle_dir}"
        git clone "https://github.com/VundleVim/Vundle.vim.git" "${vundle_dir}"
    fi
fi
unset vundle_dir

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

cat >>${extra_file} <<EOL
export GITHUB_HOST="${GH_HOST}"
EOL

echo "Done. Reload your shell"
