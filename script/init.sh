#!/bin/sh

init() {
  source $DOTFILES_ROOT/script/internal/link_file.sh

  echo "> installing dotfiles"
  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done

  echo "> setting MacOS defaults"
  $DOTFILES_ROOT/macos/set_defaults.sh

  echo "> resetting dock"
  $DOTFILES_ROOT/macos/reset_dock.sh

  echo "> installing Homebrew"
  $DOTFILES_ROOT/homebrew/install.sh 2>&1

  eval "$(/opt/homebrew/bin/brew shellenv)"

  echo "> brew update"
  brew update

  echo "> install software via Brewfile"
  brew bundle

  # find the installers and run them iteratively
  echo "> install software via install.sh files"
  find . -name install.sh -maxdepth 2 | while read installer ; do sh -c "${installer}" ; done
}
