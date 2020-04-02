current_dir=$(cd "$(dirname "$0")" && pwd)

if [ -z "$(which brew)" ]; then
    echo "brew: installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

#echo "brew: running doctor..."
#brew doctor

export HOMEBREW_BUNDLE_NO_LOCK=1

echo "brew: installing essentials..."
mkdir -p "${HOME}/.gnupg"
brew bundle --verbose --file="${current_dir}/essential"

if [ -n "$(which fzf)" ]; then
    echo "brew: configuring fzf..."
    $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
fi

dialog --title "Media utilities" \
  --yesno "Install media utilities?\n$(cat ${dotfiles_dir}/brew/media)" 10 60
brew_install_media=$?
clear

if [ ${brew_install_media} ]; then
    echo "brew: installing media extensions..."
    brew bundle --verbose --file="${current_dir}/media"
fi
