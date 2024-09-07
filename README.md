# chatbot-ui-codespace

## Description
This project is an archive and was an experiment.

The goal of this project is to create a chatbot-ui codespace container that could run chatbot-ui and use a Supabase backend.

## Features
- A Dockerfile with the necessary dependencies to run chatbot-ui.
- A `devcontainer.json` file to create a codespace container.

## Installation
There is no installation required, just a requirement to have Docker installed.

## Running the Project
To build the Docker image:
```sh
make build
```
To run the Docker image:
```sh
make run
```
## Usage
This will give you the environment to run the front end. It assumes that you have a Supabase backend running. You will need to update the .env.local file to run the front end. You can read about it at the [chatbot-ui repository](https://github.com/mckaywrigley/chatbot-ui).

This was an experiment to get chatbot-ui working in a GitHub Codespace. 

Too many issues with getting the proxy to work properly. Local container worked fine 
