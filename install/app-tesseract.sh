#!/bin/bash

# Install Tesseract OCR with all language packs
# https://github.com/tesseract-ocr/tesseract
set -e

echo "Installing Tesseract OCR..."

# Install Tesseract and all language packs
sudo apt-get install -y tesseract-ocr tesseract-ocr-all

echo "Tesseract OCR installed successfully"
