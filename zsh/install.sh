cd "$(dirname "$0")"
ZSH_DIR=$(pwd -P)

export ZSH="$ZSH_DIR/oh-my-zsh"

if [ ! -d $ZSH ]
then
  echo "> Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
else
  echo "> Updating oh-my-zsh..."
  zsh "$ZSH/tools/upgrade.sh" -c 7 # only apply updates that are at least 7 days old
fi
