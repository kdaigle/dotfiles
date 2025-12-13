#!/usr/bin/env bash

# System aliases
cat >> ~/.zshrc << 'EOF'

# System aliases
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo '=> Public key copied to pasteboard.'"
alias e="code-insiders ."
EOF
