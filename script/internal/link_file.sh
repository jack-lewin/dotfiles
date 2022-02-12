source $DOTFILES_ROOT/script/internal/confirm.sh

link_file() {
  local src=$1 dst=$2

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    warning_message="> warning! there is already a file at $dst
> overwrite the file?
> [y] to continue, or any other key to abort.
"
    continue_message="> overwriting"
    abort_message="> aborting"

    if ( confirm "$warning_message" "$continue_message" "$abort_message" -eq 0 ) then 
      exit 0
    fi

  fi

  ln -s "$1" "$2" &> /dev/null
  echo "> linked $1 to $2"
}
