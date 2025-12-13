#!/usr/bin/env bash

# Git aliases
cat >> ~/.zshrc << 'EOF'

# Git aliases
alias ga='git add'
alias grhh='git reset --hard HEAD'
alias ghead='git rev-parse --abbrev-ref HEAD'
alias gp='git add -p'
alias gpu='git pull'
alias gpp='git pull && git push'
alias gco='git checkout'
alias gcm='git commit'
alias gs='git status'
alias gd='git diff'
alias nb='git stash && git checkout master && git pull && git checkout -b'
alias db='git checkout master && git branch -D'
alias gmm='git fetch origin master; git merge master --no-edit'
alias g='git status -s -b'
EOF
