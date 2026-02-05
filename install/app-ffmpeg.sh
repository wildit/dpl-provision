#!/bin/bash

# Install ffmpeg for audio/video processing
# https://ffmpeg.org/
set -e

echo "Installing ffmpeg..."

sudo apt-get install -y ffmpeg

echo "ffmpeg installed successfully"
