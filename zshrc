echo "==> Loading .zshrc"

dotfiles_dir="${HOME}/dotfiles"

export PATH="${HOME}/bin:/usr/local/bin:./node_modules/.bin:$PATH"

export EDITOR=subl
export PAGER=less
# i=--ignore-case
# F=--quit-if-one-screen
# R=--RAW-CONTROL-CHARS
# X=--no-init
export LESS=iFRX

export NVM_DIR="${HOME}/.nvm"
export NVM_LAZY_LOAD=true

source /usr/local/share/antigen/antigen.zsh
antigen init "${dotfiles_dir}/antigenrc"

HYPHEN_INSENSITIVE="true"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source "${dotfiles_dir}/aliases.zsh"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

extra_path="${HOME}/.extra"
[ -r ${extra_path} ] && [ -f ${extra_path} ] && source ${extra_path}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

