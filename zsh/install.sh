#!/bin/sh

if test ! $(which zsh)
then
  echo "    Installing zsh for you."
  brew install zsh > /tmp/zsh-install.log
fi
