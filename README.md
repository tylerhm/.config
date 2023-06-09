# .dots

This repository tracks and syncs my personal dot files.

## Installation

Make a fork of this repo and clone it somewhere on your machine. I like `$HOME/.dots`.

## Usage

1. Any new dotfiles that you'd like to track should be placed in this directory as if it was your home directory. For an example, a dot file at `$HOME/.config/gh/config.yml` would be placed at `./.config/gh/config.yml`.

2. Run `./pu.sh` to push symbolic links of your dotfiles to their actual location in `$HOME/...`. Since these are symlinks, any updates you make in this repository will be immediately reflected to the system as a whole.

3. Commit and push your changes, and simply clone and run `./pu.sh` next time you need your dotfiles on a new machine.

## Disclaimer

For ease of use, links are created *forcefully* and will delete any data stored at the terminal dot file location. Use with caution.
