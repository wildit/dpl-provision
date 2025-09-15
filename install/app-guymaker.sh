#!/bin/bash
# Install Guymager on Ubuntu
set -e

# Update package list
sudo apt update -y

# Install Guymager
sudo apt install -y guymager

echo "Guymager installation complete. You can launch Guymager from the application menu or by typing 'guymager' in the terminal."
