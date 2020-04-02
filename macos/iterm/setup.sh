current_dir=$(cd "$(dirname "$0")" && pwd)

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${current_dir}/com.googlecode.iterm2.plist"
