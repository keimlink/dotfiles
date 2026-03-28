#!/usr/bin/env bash
# macOS system defaults

# --- Finder ---
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Disable the warning before changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# --- Dock ---
# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true
# Minimize Dock icon size to 36px
defaults write com.apple.dock tilesize -int 36

# --- Keyboard ---
# Enable fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# --- Screenshots ---
# Save screenshots to ~/Screenshots
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# Apply changes
killall Finder 2>/dev/null || true
killall Dock 2>/dev/null || true

echo "macOS defaults applied."
