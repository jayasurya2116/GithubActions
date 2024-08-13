# Use the official Ubuntu image as a base
FROM ubuntu:20.04

# Set environment variables
ENV RUNNER_VERSION=2.319.0

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    git \
    sudo \
    libicu66 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for the runner
RUN mkdir -p /actions-runner
WORKDIR /actions-runner

# Download the latest runner package
RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# Optional: Validate the hash
RUN echo "52b8f9c5abb1a47cc506185a1a20ecea19daf0d94bbf4ddde7e617e7be109b14  actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" | shasum -a 256 -c

# Extract the installer
RUN tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# Copy the entrypoint script
COPY entrypoint.sh /actions-runner/entrypoint.sh
RUN chmod +x /actions-runner/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/actions-runner/entrypoint.sh"]
