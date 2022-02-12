cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

# TODO
# defaults read com.apple.Accessibility KeyRepeatDelay
# defaults read com.apple.Accessibility KeyRepeatInterval
# defaults read com.apple.AppleMultitouchMouse
# defaults read com.apple.AppleMultitouchTrackpad
# defaults read com.apple.driver.AppleBluetoothMultitouch.mouse
# defaults read com.apple.driver.AppleBluetoothMultitouch.trackpad

# defaults write -g AppleFirstWeekday -dict gregorian 2
# defaults write -g AppleICUForce24HourTime -bool true


#
# General
#

# Minimize applications when double-clicking the title bar
defaults write -g AppleActionOnDoubleClick Minimize
defaults write -g AppleMiniaturizeOnDoubleClick -bool true

# Configure auto-correct, text substitution, etc
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool true
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

#
# Menu bar
#

defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible UserSwitcher" -bool false
defaults write com.apple.Spotlight "NSStatusItem Visible Item-0" -bool true
defaults write com.raycast.macos "NSStatusItem Visible raycastIcon" -bool false

#
# Dock
#

# Auto-hide Dock
defaults write com.apple.dock autohide -bool true

# Set icon size
defaults write com.apple.dock tilesize -int 48

# Don't rearrange Spaces automatically
defaults write com.apple.dock mru-spaces -bool false

# Don't show recent apps
defaults write com.apple.dock show-recents -bool false

killall Dock

#
# Finder
#

# Enable "quit" for the Finder app
defaults write com.apple.finder QuitMenuItem -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Hide tags in the sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Use list view by default
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# Open in home directory by default
defaults write com.apple.finder NewWindowTarget PfHm

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable "file extension change" warning
defaults write com.apple.finder FXEnableExtensionsChangeWarning -bool false 

killall Finder

#
# Privacy
#

defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib allowIdentifierForAdvertising -bool false

#
# Apple products
#

# Don't recommend Safari
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariBackOffInterval 31536000000
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate "9999-12-31 23:59:59 +0000"

#
# Applications
#

# Configure iTerm2 to load preferences from dotfiles repo
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES_ROOT/iterm2"

# Replace Spotlight with Raycast
defaults write com.raycast.macos raycastGlobalHotkey -string "Command-49"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '{ "enabled"="0"; }'

# Other Raycast settings
defaults write com.raycast.macos raycastPreferredTheme -string "raycast-dark"
