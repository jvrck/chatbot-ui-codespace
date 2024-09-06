#!/bin/bash

set -e  # Stop the script if any command fails

# Clone the chatbot-ui repository, checkout the commit, delete git, and install npm packages
if [ ! -d "chatbot-ui" ]; then
    echo "Cloning chatbot-ui repository..."
    git clone https://github.com/mckaywrigley/chatbot-ui.git
    cd chatbot-ui
    
    echo "Checking out the specific commit..."
    # git checkout 81328b61d2a4ab597a7a057be70e785cf756d9f8
    git checkout $COMMIT
    
    echo "Removing git versioning..."
    rm -rf .git
    
    echo "Installing npm packages..."
    npm install || { echo "npm install failed"; exit 1; }
    npm run build || { echo "npm run build failed"; exit 1; }
    
    echo "Setup complete."
else
    echo "chatbot-ui directory already exists."
fi


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