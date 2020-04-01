config_dir="${HOME}/Library/Application Support/Spectacle"

mkdir -p "${config_dir}"
ln -sf Shortcuts.json "${config_dir}/Shortcuts.json"
defaults import com.divisiblebyzero.Spectacle com.divisiblebyzero.Spectacle.plist
