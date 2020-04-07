# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# mute all sounds, incl volume change feedback
defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 0
defaults write NSGlobalDomain com.apple.sound.beep.flash -int 0
defaults write NSGlobalDomain com.apple.sound.beep.sound -string "/System/Library/Sounds/Tink.aiff"
defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -int 0

# Disable power chime
defaults write com.apple.PowerChime ChimeOnAllHardware -bool false
defaults write com.apple.PowerChime ChimeOnNoHardware -bool true
