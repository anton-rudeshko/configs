echo "git: configuring..."

current_dir=$(cd "$(dirname "$0")" && pwd)

current_git_user=$(git config --global --get user.name || echo)
current_git_email=$(git config --global --get user.email || echo)
current_gh_host=${GITHUB_HOST:-github.com}

read -p "git: enter your full name (${current_git_user}): " git_user
read -p "git: enter your e-mail (${current_git_email}): " git_email
read -p "git: enter your GitHub host (${current_gh_host}): " gh_host

git_user=${git_user:-$current_git_user}
git_email=${git_email:-$current_git_email}
gh_host=${gh_host:-$current_gh_host}

cp -f "${current_dir}/gitconfig.template" "${HOME}/.gitconfig"

git config --global user.name "${git_user}"
git config --global user.email "${git_email}"

git config --global core.excludesfile "${current_dir}/global.gitignore"

cat >>${extra_file} <<EOL
export GITHUB_HOST="${gh_host}"
EOL
