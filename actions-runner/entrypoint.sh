#!/bin/bash

# Set the URL and token as environment variables
URL=${RUNNER_URL:-"https://github.com/jayasurya2116/DevOps-IaC"}
TOKEN=${RUNNER_TOKEN:-"AQUDJLF5FUAQBC2EQH7VKPDGXNJ6Y"}

# Configure the runner
./config.sh --url ${URL} --token ${TOKEN} --unattended --replace

# Run the runner
./run.sh
