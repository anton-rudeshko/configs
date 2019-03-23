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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

cat >>${extra_file} <<EOL
eval \$($(brew --prefix)/bin/brew shellenv)

source "${dotfiles_dir}/wsl-runtime.bash"
EOL

echo "==> Running brew doctor..."
brew doctor

echo "==> Installing gcc..."
brew install gcc
