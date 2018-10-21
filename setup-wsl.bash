# Written for Microsoft Store Ubuntu 18.04

dotfiles_dir=`cd "$(dirname "$0")" && pwd`
extra_file="${HOME}/.extra"

set -e

# All newly created files and dirs will have permissions: o+rwx g+r
umask 027

echo -n "==> Upgrading existing packages..."
sudo apt-get update -qq && sudo apt-get upgrade -qq
echo " ok"

linuxbrew_deps="build-essential curl file git"
echo -n "==> Installing linuxbrew dependencies ${linuxbrew_deps}..."
sudo apt-get install -qq ${linuxbrew_deps}
echo " ok"

linuxbrew_src="https://github.com/Linuxbrew/brew.git"
linuxbrew_dir="${HOME}/.linuxbrew"

if [ -d "${linuxbrew_dir}/.git" ]; then
    echo -n "==> Pulling latest linuxbrew changes in ${linuxbrew_dir}..."
    git --git-dir "${linuxbrew_dir}/.git" pull -q
else
    echo -n "==> Cloning linuxbrew to ${linuxbrew_dir}..."
    git clone -q "${linuxbrew_src}" "${linuxbrew_dir}"
fi
mkdir -p ${linuxbrew_dir}/{etc,include,lib,sbin,share,Frameworks,opt}
echo " ok"

echo "==> Running brew doctor..."
brew doctor

cat >>${extra_file} <<EOL
export PATH="${linuxbrew_dir}/bin:${PATH}"

source ${dotfiles_dir}/wsl-runtime.bash"
EOL
