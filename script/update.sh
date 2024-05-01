#!/bin/sh

update() {
  source $DOTFILES_ROOT/script/internal/link_file.sh

  echo "> installing dotfiles"
  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done

  echo "> brew update"
  brew update

  echo "> install software via Brewfile"
  brew bundle

  # find the updaters and run them iteratively
  echo "> update software via update.sh files"
  find . -name update.sh | while read updater ; do sh -c "${updater}" ; done
}
