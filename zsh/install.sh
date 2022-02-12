cd "$(dirname "$0")"
ZSH_DIR=$(pwd -P)

export ZSH="$ZSH_DIR/oh-my-zsh"

if [ ! -d $ZSH ] 
then
  echo "> Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
fi
