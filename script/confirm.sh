# usage:
#   confirm "warning! this will do X. press [y] to continue, or any other key to abort" "continuing..." "aborting.."
#
# args:
#   $1 warning_message
#   $2 continue_message
#   $3 abort_message

confirm() {
  printf "$1"

  read -n1 action
  case $action in
      y) printf "\n$2\n" ; return 1 ;;
      *) printf "\n$3\n" ; return 0 ;;
  esac
}
