# Dotfiles

## Components

There's a few special files in the hierarchy.

- **topic/install.sh**: Will get installed and loaded for each topic.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap.sh`.
- **Brewfile**: Install the Homebrew packages and casks that you need.

## Install

First, install [Homebrew](https://brew.sh/).

Run this:

```sh
git clone https://github.com/kdaigle/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./script/bootstrap.sh
```

This will install and symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## Thanks

I borrowed the original version from @holman's excellent [dotfiles](https://github.com/holman/dotfiles).
