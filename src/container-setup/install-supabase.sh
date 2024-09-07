#!/bin/bash

set -e  # Stop the script if any command fails

# Check if Supabase CLI is already installed
if ! command -v supabase &> /dev/null; then
    URL_ARM64="https://github.com/supabase/cli/releases/download/v1.191.3/supabase_1.191.3_linux_arm64.deb"
    URL_AMD64="https://github.com/supabase/cli/releases/download/v1.191.3/supabase_1.191.3_linux_amd64.deb"
    
    # Detect architecture
    ARCH=$(dpkg --print-architecture)
    
    if [ "$ARCH" = "arm64" ]; then
        DEB_FILE="supabase_arm64.deb"
        URL=$URL_ARM64
    elif [ "$ARCH" = "amd64" ]; then
        DEB_FILE="supabase_amd64.deb"
        URL=$URL_AMD64
    else
        echo "Unsupported architecture: $ARCH"
        exit 1
    fi
    
    # Download the corresponding deb file
    echo "Downloading Supabase CLI for $ARCH..."
    wget -O $DEB_FILE $URL
    
    # Install the downloaded deb file using apt
    echo "Installing Supabase CLI..."
    sudo apt install ./$DEB_FILE -y
    
    # Cleanup
    echo "Cleaning up..."
    rm $DEB_FILE
    
    echo "Supabase CLI installation complete."
else
    echo "Supabase CLI is already installed."
fi