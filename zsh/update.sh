cd "$(dirname "$0")"
ZSH_DIR=$(pwd -P)

export ZSH="$ZSH_DIR/oh-my-zsh"

if [ -d $ZSH ] 
then
  echo "> Updating oh-my-zsh..."
  zsh -c "source $ZSH/oh-my-zsh.sh && omz update --unattended"
fi
