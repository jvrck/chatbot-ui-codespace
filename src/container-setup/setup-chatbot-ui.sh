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
    
    echo "Setup complete."
else
    echo "chatbot-ui directory already exists."
fi
