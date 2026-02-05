#!/bin/bash

# Install essential development and system tools
set -e

echo "Installing development tools..."

# Git - version control
sudo apt-get install -y git

# htop - interactive process viewer
sudo apt-get install -y htop

# ripgrep - fast search tool
sudo apt-get install -y ripgrep

# ncdu - disk usage analyzer
sudo apt-get install -y ncdu

# tmux - terminal multiplexer
sudo apt-get install -y tmux

# tree - directory listing
sudo apt-get install -y tree

echo "Development tools installed successfully (git, htop, rg, ncdu, tmux, tree)"
