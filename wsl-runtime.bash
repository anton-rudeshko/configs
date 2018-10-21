export PURE_PROMPT_SYMBOL='»'
export PURE_GIT_DOWN_ARROW='↑'
export PURE_GIT_UP_ARROW='↓'

# Note: Bash on Windows does not currently apply umask properly.
# see https://github.com/Microsoft/WSL/issues/352
if [ "$(umask)" = "0000" ]; then
    umask 027
fi

alias open="explorer.exe"
