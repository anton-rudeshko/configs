alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'

alias gcd='git checkout dev'

alias gsw='git switch'
alias gsc='git switch --create'
alias gs-='git switch -'
alias gsd='git switch dev'
alias gsm='git switch master'

alias gl='git lol'
alias gh='git hist'

alias gf='git fetch'
alias gfu='git fetch upstream'
alias gfp='git fetch --prune'
alias gfpu='git fetch --prune upstream'
alias grh='git reset --hard'

# Reset current branch to its origin state
alias grho='git reset --hard origin/$(gbc)'

# Pull changes without merge
alias gpf='git pull --ff-only'
alias gpfu='git pull --ff-only upstream'

# Pull changes and rebase local commits
alias gpr='git pull --rebase'
alias gpru='git pull --rebase upstream'

# Push current branch and setup upstream
alias gpc='git push -u origin $(gbc)'
# Force push current branch
alias gpcf='git push -u origin +$(gbc)'

# Cherry-picking
alias gcp='git cherry-pick '
alias gcpa='git cherry-pick --abort'

# Go to dev and update it (git update dev)
alias gud='god && gpf'

alias grbd='git rebase dev'
alias grbid='git rebase -i dev'
alias grbim='git rebase -i master'

alias gsh='git show'
alias ghs='git hash'
alias gbc='git rev-parse --abbrev-ref HEAD' # git-branch-current
alias gsd='git show -s --format="%ci"' # git-show-date

# Execute on feature branch.
# Updates dev (or master) and then rebases current branch
alias gudc='gcd && gpf && gco - && grbd'
alias gumc='gcm && gpf && gco - && grbm'

# git-svn aliases
alias gog='go git-svn'
alias gsr='git svn rebase'
alias gsrb='git rebase git-svn'
alias gugc='gog && gsr && go - && gsrb'
alias gsc='git svn dcommit'

# defunkt hub alias
if type hub &> /dev/null; then
    alias git='hub'
    alias ghbr='git browse'
fi

if type fasd &> /dev/null; then
    alias e='fasd -ae $EDITOR'
    alias v='fasd -fe bat'
    alias o='fasd -ae open'
    alias m='fasd -de mc'
fi

alias nit='npm install && npm test'

alias -g L='| less'
alias -g C='| pbcopy'

if type fzf &> /dev/null; then
    alias afz='alias | fzf'
    alias efz='env | fzf'
    alias gfz='git config --list | fzf'
fi

if type ag &> /dev/null; then
    alias -g G='| ag'
else
    alias -g G='| grep'
fi

if type mdcat &> /dev/null; then
    mdcatless() {
        mdcat $1 | less -r
    }

    alias -s md=mdcatless
fi
