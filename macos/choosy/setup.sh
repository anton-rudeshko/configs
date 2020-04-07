current_dir=$(cd "$(dirname "$0")" && pwd)

defaults import com.choosyosx.Choosy "${current_dir}/com.choosyosx.Choosy.plist"

mkdir -p "${HOME}/Library/Application Support/Choosy/"
cp -f "${current_dir}/behaviours.plist" "${HOME}/Library/Application Support/Choosy/behaviours.plist"
