#!/bin/sh

# this file does the following:
#   1. sources every alias.sh file
#   2. creates an alias for each namespace. e.g. zsh/alias.sh will have a "zsh?" alias
#      -  this will output the custom-defined aliases
#      -  it will also run, if present, the dotfiles_info() function from the alias.sh file
#

source $DOTFILES_ROOT/script/internal/alias_info.sh

for alias_file in $DOTFILES_ROOT/*/alias.sh
do
  source $alias_file

  dir_and_file=${alias_file/#${DOTFILES_ROOT}\//}

  # unescaped regex: ^(.*)/(.*)$
  # raw sed command: sed -n -e 's/ESCAPED_REGEX/\1/p'
  dir=$(echo $dir_and_file | sed -n -e 's/^\(.*\)\/\(.*\)$/\1/p')
  alias "$dir?"="echo '> useful $dir aliases:'; alias_info $dir; source $alias_file; if test $(which dotfiles_info); then dotfiles_info; fi"
done
