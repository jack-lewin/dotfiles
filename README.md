# dotfiles

## Installation

1. Install `git`

2. Install Command Line Tools:

  `xcode-select --install`

3. Clone this repo:

  `git clone https://github.com/jack-lewin/dotfiles ~/code/dotfiles`

4. Run the init script:

  `~/code/dotfiles/bin/dot init`

  This will do the following:

  - install software from the Brewfile
  - install software from dotfiles/*/install.sh
  - apply some default settings for macos
  - add dotfiles/bin/* to your PATH


## How to use

Periodically run `dot update`. This will:

  - update Homebrew and applications from the Brewfile
  - update software from dotfiles/*/update.sh


## Special files

- `./bin/*` files are included in the PATH
- `./system/*` files are included in the .zshrc

- `*.symlink` files are symlinked to the home directory
- `local.sh` and `*.local.symlink` files are gitignored
- `alias.sh` files are included in the .zshrc
  - each namespace will get its own alias to quickly `cat` the file, e.g. `zsh?` is aliased to `cat ./zsh/alias.sh`
- `install.sh` files are run during `dot init`
- `update.sh` files are run during `dot update`
