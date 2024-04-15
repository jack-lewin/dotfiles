#!/bin/sh

source $DOTFILES_ROOT/script/internal/link_file.sh

dst="$HOME/Library/LaunchAgents/start-virtual-webcam.plist"

link_file ./start-virtual-webcam.plist "$dst"

launchctl load "$dst"
