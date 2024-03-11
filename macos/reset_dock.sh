#!/bin/sh

source $DOTFILES_ROOT/script/internal/confirm.sh

warning_message="> warning! this will remove all the apps from your Dock
> [y] to continue, or any other key to abort.
"
continue_message="> resetting dock"
abort_message="> aborting"

if ( confirm "$warning_message" "$continue_message" "$abort_message" -eq 0 ) then 
  exit 0
fi

defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

killall Dock
