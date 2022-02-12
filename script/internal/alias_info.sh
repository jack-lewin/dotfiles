# usage:
#   alias_info git
#
# args:
#   $1 directory

alias_info() {
  # unescaped regex: ^alias (.*)=.*
  # raw sed command: sed -n -e 's/ESCAPED_REGEX/\1/p'
  eval "$(cat $DOTFILES_ROOT/$1/alias.sh | grep "^alias" | sed -n -e 's/^alias \(.*\)=.*/which \1/p')"
}
