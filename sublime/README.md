# Sublime Text 3 settings

On macOS stored at

```
${HOME}/Library/Application Support/Sublime Text 3/Packages/User
```

Link:

```
dotfiles_dir="${HOME}/dotfiles"
sublime_dir="${HOME}/Library/Application Support/Sublime Text 3"

ln -sf "${dotfiles_dir}/sublime/Preferences.sublime-settings" \
    "${sublime_dir}/Packages/User/Preferences.sublime-settings"
ln -sf "${dotfiles_dir}/sublime/Package Control.sublime-settings" \
    "${sublime_dir}/Packages/User/Package Control.sublime-settings"
```
