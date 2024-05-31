#!/bin/sh

source $DOTFILES_ROOT/script/internal/confirm.sh

link_file() {
  src=$1
  dst=$2

  already_exists=$([ -f "$dst" -o -d "$dst" -o -L "$dst" ])
  is_symlinked=$([ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ])

  if $already_exists && $is_symlinked
  then
    return

  elif $already_exists
  then

    warning_message="> warning! there is already a different file at $dst.
> do you want to overwrite it?
> [y] to continue, or any other key to abort.
"
    continue_message="> overwriting"
    abort_message="> aborting"

    if ( confirm "$warning_message" "$continue_message" "$abort_message" -eq 0 ) then 
      exit 0
    fi

  fi

  ln -s "$src" "$dst" &> /dev/null
  echo "> linked $src to $dst"
}
