# Dotfiles

## Components

There's a few special files in the hierarchy.

- **topic/install.fish**: Will get installed and loaded for each topic.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap.fish`.
- **Brewfile**: Install the Homebrew packages and casks that you need.

## Install

First, install [Homebrew](https://brew.sh/).

Run this:

```sh
brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
# Restart your terminal
git clone https://github.com/kdaigle/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./script/bootstrap.fish
```

This will install and symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## Thanks

I borrowed the orginal version from @holman's excellent [dotfiles](https://github.com/holman/dotfiles). This newest version is based on @caarlos0's fish-focused [dotfiles](https://github.com/caarlos0/dotfiles.fish).
