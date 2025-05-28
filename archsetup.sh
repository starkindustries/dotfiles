#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo "---------------------------------------------------------"
echo "            Starting Arch Linux Setup Script             "
echo "---------------------------------------------------------"
echo

# Check if running as root
if [[ "$EUID" -ne 0 ]]; then
    echo "Error: This script must be run with sudo privileges."
    exit 1
fi

# --- Install Basic Utilities ---
echo "Installing basic utilities..."
sudo pacman -S --noconfirm tmux less tree git github-cli npm vim hyprlock hypridle
echo "Basic utilities installed."
echo

# --- Install Neofetch (for the memes!) ---
echo "Installing neofetch..."
sudo pacman -S --noconfirm neofetch
neofetch
echo "Neofetch installed and ran. Enjoy the info!"
echo

# --- Install pavucontrol (PulseAudio GUI) ---
echo "Installing pavucontrol (Audio control GUI)..."
sudo pacman -S --noconfirm pavucontrol
echo "pavucontrol installed. Run 'pavucontrol' to configure audio."
echo

# --- Install Fonts ---
# https://unix.stackexchange.com/questions/685690/arch-linux-find-missing-fonts-and-installing-them
echo "Installing essential fonts..."
sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
echo "Essential fonts installed."
echo

# --- Install FUSE (for AppImage support) ---
echo "Installing FUSE (for AppImage support)..."
sudo pacman -S --noconfirm fuse
echo "FUSE installed. You can now run .AppImage files."
echo

# --- Install wev (Wayland event viewer) ---
echo "Installing wev (Wayland event viewer)..."
sudo pacman -S --noconfirm wev
echo "wev installed. Useful for troubleshooting keyboard/pointer events."
echo

# --- Install wl-clipboard (Wayland clipboard) ---
echo "Installing wl-clipboard (Wayland clipboard)..."
sudo pacman -S --noconfirm wl-clipboard
echo "wl-clipboard installed. Essential for Wayland users."
echo

echo
echo "---------------------------------------------------------"
echo "             Arch Linux Setup Script Completed!          "
echo "---------------------------------------------------------"
