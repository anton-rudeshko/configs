echo "==> Loading .profile"

[ -n "`which brew`" ] && source $(brew --prefix nvm)/nvm.sh

# git prompt & completion
source ~/configs/git-prompt.sh
source ~/configs/git-completion.bash

for file in ~/configs/.{bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

[ -r ~/.extra ] && [ -f ~/.extra ] && source ~/.extra

# do not expand paths like '~/' on tab
_expand()
{
    return 0;
}
