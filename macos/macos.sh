current_dir=$(cd "$(dirname "$0")" && pwd)
masfile="${current_dir}/Masfile"

#brew bundle --verbose --file="${current_dir}/Caskfile"

if [ -n "$(which mas)" ]; then
    cat "${masfile}"
    read -p "Install these apps from AppStore? (y/n) " -n 1 -r
    echo
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
      brew bundle --verbose --file="${masfile}"
    fi
else
    echo "Updating brew mas bundle..."
    brew bundle --verbose --file="${masfile}"
fi

# TODO install casks
# TODO configure system

echo "Please reboot."
