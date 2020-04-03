current_dir=$(cd "$(dirname "$0")" && pwd)

curl -L https://iterm2.com/shell_integration/zsh -o "${current_dir}/shell_integration.zsh"

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${current_dir}"
