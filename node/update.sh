cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)
source $DOTFILES_ROOT/script/internal/get_latest_github_release.sh

latest_release=$(get_latest_release nvm-sh/nvm)
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$latest_release/install.sh" | bash

