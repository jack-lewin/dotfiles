#!/bin/sh

# this file does the following:
#   1. sources every alias.sh file
#   2. creates an alias for each namespace. e.g. zsh/alias.sh will have a "zsh?" alias
#      ->  this will output the custom-defined aliases
#

source $DOTFILES_ROOT/script/alias_info.sh

for alias_file in $DOTFILES_ROOT/*/alias*.sh
do
  source $alias_file

  dir_and_file=${alias_file#$DOTFILES_ROOT/}
  dir=${dir_and_file%%/*}

  alias "$dir?"="echo '> useful $dir aliases:'; alias_info $dir; source $alias_file;"
done
