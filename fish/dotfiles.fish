set PATH /opt/homebrew/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# First tab should autocomplete the suggestion
bind \t accept-autosuggestion