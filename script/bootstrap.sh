#!/usr/bin/env bash
#
# bootstrap installs things.

set -e

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"

info() {
	printf '\r  [ \033[00;34m..\033[0m ] %s\n' "$1"
}

user() {
	printf '\r  [ \033[0;33m??\033[0m ] %s\n' "$1"
}

success() {
	printf '\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n' "$1"
}

fail() {
	printf '\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n' "$1"
	echo ''
	exit 1
}

setup_gitconfig() {
	if [ -z "$(git config --global --get user.email)" ]; then
		user 'What is your github author name?'
		read -r user_name
		user 'What is your github author email?'
		read -r user_email

		git config --global user.name "$user_name"
		git config --global user.email "$user_email"
	elif [ "$(git config --global --get dotfiles.managed)" != "true" ]; then
		user_name="$(git config --global --get user.name)"
		user_email="$(git config --global --get user.email)"
		mv ~/.gitconfig ~/.gitconfig.backup
		git config --global user.name "$user_name"
		git config --global user.email "$user_email"
		success "moved ~/.gitconfig to ~/.gitconfig.backup"
	else
		info "already managed by dotfiles"
	fi

	git config --global include.path ~/.gitconfig.local
	git config --global dotfiles.managed true
}

link_file() {
	local src=$1 dst=$2 backup=$3

	if [ -e "$dst" ]; then
		local newf
		newf="$(readlink "$dst" 2>/dev/null || true)"
		if [ "$newf" = "$src" ]; then
			success "skipped $src"
			return
		else
			mv "$dst" "$dst.$backup"
			success "moved $dst to $dst.$backup"
		fi
	fi

	mkdir -p "$(dirname "$dst")"
	ln -sf "$src" "$dst"
	success "linked $src to $dst"
}

install_dotfiles() {
	# Link zshrc
	link_file "$DOTFILES_ROOT/zsh/zshrc.symlink" "$HOME/.zshrc" backup

	# Link all .symlink files
	for src in "$DOTFILES_ROOT"/*/*.symlink; do
		if [ -f "$src" ]; then
			dst="$HOME/.$(basename "${src%.symlink}")"
			link_file "$src" "$dst" backup
		fi
	done

	# Link ssh config
	link_file "$DOTFILES_ROOT/ssh/config" "$HOME/.ssh/config" local
}

setup_gitconfig && success 'gitconfig' || fail 'gitconfig'

install_dotfiles && success 'dotfiles' || fail 'dotfiles'

# Run install scripts
for installer in "$DOTFILES_ROOT"/*/install.sh; do
	if [ -f "$installer" ]; then
		bash "$installer" && success "$installer" || fail "$installer"
	fi
done

# Add zsh to shells if not already present
if ! grep -q "$(command -v zsh)" /etc/shells; then
	command -v zsh | sudo tee -a /etc/shells
	success 'added zsh to /etc/shells'
fi

# Change shell to zsh if not already
if [ "$SHELL" != "$(command -v zsh)" ]; then
	chsh -s "$(command -v zsh)"
	success "set zsh as the default shell"
fi

success 'dotfiles installed/updated!'
