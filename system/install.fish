#!/usr/bin/env fish

# Pipe my public key to my clipboard.
abbr -a pubkey "more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
abbr -a e "code-insiders ."