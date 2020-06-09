vundle_dir="${HOME}/.vim/bundle/Vundle.vim"

if [ ! -d "${vundle_dir}" ]; then
    read -p "Install vundle? (y/n) " -n 1 -r
    echo
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
        echo "vim: installing Vundle..."
        mkdir -p "${vundle_dir}"
        git clone "https://github.com/VundleVim/Vundle.vim.git" "${vundle_dir}"
    fi
fi

if [ -d "${vundle_dir}" ]; then
    echo "vim: running Vundle:PluginInstall..."
    vim -c 'PluginInstall' -c 'qa!'
fi

echo "vim: symlinking vimrc..."
ln -sf "${dotfiles_dir}/vim/vimrc" "${HOME}/.vimrc"
