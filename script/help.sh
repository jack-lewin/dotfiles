#!/bin/sh

USAGE="~~~~~~~~~~~~~~~
~~~~~ dot ~~~~~
~~~~~~~~~~~~~~~

usage:
  dot [command]

available commands:
  help          display this message
  init          install/symlink dotfiles, set macos defaults, reset dock, install software
  reset-dock    remove all apps from your dock
  update        run software updates
"

help() {
  echo "$USAGE"
}
