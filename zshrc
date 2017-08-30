echo "==> Loading .zshrc"

dotfiles_dir="${HOME}/dotfiles"

export PATH="${HOME}/bin:/usr/local/bin:./node_modules/.bin:$PATH"

export EDITOR=subl
export NVM_DIR="${HOME}/.nvm"
export NVM_LAZY_LOAD=true

source /usr/local/share/antigen/antigen.zsh
antigen init "${dotfiles_dir}/antigenrc"

HYPHEN_INSENSITIVE="true"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source "${dotfiles_dir}/aliases.zsh"

extra_path="${HOME}/.extra"
[ -r ${extra_path} ] && [ -f ${extra_path} ] && source ${extra_path}

