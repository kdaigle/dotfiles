#!/usr/bin/env fish

abbr -a ga 'git add'
abbr -a grhh 'git reset --hard HEAD'
abbr -a ghead 'git rev-parse --abbrev-ref HEAD'
abbr -a gp 'git add -p'
abbr -a gpu 'git pull'
abbr -a gpp 'git pull && git push'
abbr -a gco 'git checkout'
abbr -a gcm 'git commit'
abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a nb 'git stash && git checkout master && git pull && git checkout -b "$argv" && echo "You may need to pop your stash..."'
abbr -a db 'git checkout master && git branch -D'
abbr -a gmm 'git fetch origin master; git merge master --no-edit'
abbr -a g 'git status -s -b'
