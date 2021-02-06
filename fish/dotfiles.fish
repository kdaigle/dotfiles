set PATH /opt/homebrew/bin $PATH

# Set up init for rbenv
status --is-interactive; and source (rbenv init -|psub)

# First tab should autocomplete the suggestion
bind \t accept-autosuggestion