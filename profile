echo "==> Loading .profile"

export PATH="~/bin:/usr/local/bin:./node_modules/.bin:$PATH"

export NVM_DIR=~/.nvm

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export BLOCKSIZE=K
export EDITOR=vim
export PAGER=less
export LESS=-asrRix4

# bash completion
if [ -n "`which brew`" ]; then
    source $(brew --prefix nvm)/nvm.sh
    [ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion
else
    source ~/configs/git-prompt.sh
    source ~/configs/git-completion.bash
fi

for file in ~/configs/.{bash_prompt,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

[ -r ~/.extra ] && [ -f ~/.extra ] && source ~/.extra

# do not expand paths like '~/' on tab
_expand()
{
    return 0;
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
