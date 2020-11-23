####
# GIT
####
alias ga="git add"
alias grhh="git reset --hard HEAD"
alias ghead="git rev-parse --abbrev-ref HEAD"
alias gp="git add -p"
alias gpu="git pull"
alias gpp="git pull && git push"
alias gco="git checkout"
alias gcm="git commit"
alias gs="git status"
alias gd="git diff"
function nb() { git stash && git checkout master && git pull && git checkout -b "$@" && echo "You may need to pop your stash..."; }
alias db="git checkout master && git branch -D"
alias gmm="git fetch origin master; git merge master --no-edit"
alias g="git status -s -b"
function test_api() {
  export SHA="$(curl $1/site/sha)"
  curl -vv --user-agent "curl/$SHA" $1/api/v3/repos/rails/rails
}
