current_dir=$(cd "$(dirname "$0")" && pwd)
config_dir="${HOME}/Library/Application Support/Spectacle"

mkdir -p "${config_dir}"
cp -f "${current_dir}/Shortcuts.json" "${config_dir}/Shortcuts.json"
defaults import com.divisiblebyzero.Spectacle "${current_dir}/com.divisiblebyzero.Spectacle.plist"
