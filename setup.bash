#!/usr/bin/env bash

set -e

export dotfiles_dir=$(cd "$(dirname "$0")" && pwd)
export extra_file="${HOME}/.extra"

echo "dotfiles: home dir is ${HOME}"
echo "dotfiles: dotfiles dir is ${dotfiles_dir}"

echo "dotfiles: pulling recent updates..."
git -C "${dotfiles_dir}" pull

rm -f ${extra_file}

"${dotfiles_dir}/brew/brew.sh"

if [[ ${OSTYPE} =~ darwin ]]; then
    echo "dotfiles: macOS detected"

    "${dotfiles_dir}/macos/macos.sh"
fi

if [[ $(uname -r) =~ Microsoft ]]; then
    echo "dotfiles: WSL detected"

    "${dotfiles_dir}/setup-wsl.bash"
fi

"${dotfiles_dir}/vim/vim.sh"

echo "dotfiles: symlinking configs..."
for file in zshrc tmux.conf; do
    ln -sf "${dotfiles_dir}/${file}" "${HOME}/.${file}"
done

"${dotfiles_dir}/git/git.sh"

echo "dotfiles: it's done, please reload your shell"
