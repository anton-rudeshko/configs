# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Use functional keys as F1, F2 etc
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable text completion in touch bar
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# Remove Siri from default touch bar layout
defaults write com.apple.controlstrip MiniCustomized -array "com.apple.system.brightness" "com.apple.system.volume" "com.apple.system.mute"

# Fn keys by default on strip
defaults write com.apple.touchbar.agent PresentationModeGlobal -string functionKeys
defaults write com.apple.touchbar.agent PresentationModeFnModes -dict-add functionKeys -string fullControlStrip
