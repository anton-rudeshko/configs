function detect_defaults_change() {
    diff -u <(defaults read) <(read -sk "?Press any key to continue...\n"; defaults read) | diff-so-fancy
}
