# Use the official base image from Microsoft Dev Containers (Debian-based image)
FROM mcr.microsoft.com/devcontainers/base:noble

# Set the working directory inside the container
WORKDIR /app

# Set environment variables for the desired Node.js version and the specific commit for version control (if applicable)
ENV VERSION=20.11.0
ENV COMMIT=81328b61d2a4ab597a7a057be70e785cf756d9f8

# Copy the entire container-setup directory into the /app/container-setup directory inside the container
COPY ./container-setup /app/container-setup

# Ensure that all shell scripts in the container-setup directory have executable permissions
RUN chmod +x /app/container-setup/*.sh

# Install Node.js using the script
RUN /app/container-setup/install-node.sh

# Install Supabase CLI using the script
RUN /app/container-setup/install-supabase.sh

# Source nvm (Node Version Manager) and set up the Chatbot UI environment
RUN /bin/bash -c "source /usr/local/share/nvm/nvm.sh && /app/container-setup/setup-chatbot-ui.sh"

CMD ["/bin/bash"]