#!/usr/bin/env bash

# Exit immediately if any command fails
set -e

# Find the directory where this script is located
SCRIPT_DIR="$(dirname "$0")"

echo "Copying configuration.nix..."
# Use the correct path relative to the script's location
sudo cp "$SCRIPT_DIR/configuration.nix" /etc/nixos/

echo "Starting NixOS rebuild..."
# The rebuild command must be run with sudo for system-wide changes
sudo nixos-rebuild switch

echo "NixOS switch complete!"
