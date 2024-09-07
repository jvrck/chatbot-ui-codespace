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

# # Install Nginx
# RUN apt-get update && apt-get install -y nginx

# # Configure Nginx to reverse proxy the application on port 3000 to port 80 and 3001 externally
# RUN echo 'server {\n\
#     listen 80;\n\
#     location / {\n\
#         proxy_pass http://localhost:3000;\n\
#         proxy_set_header Host $host;\n\
#         proxy_set_header X-Real-IP $remote_addr;\n\
#         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n\
#         proxy_set_header X-Forwarded-Proto $scheme;\n\
#     }\n\
# }\n\
# server {\n\
#     listen 3001;\n\
#     location / {\n\
#         proxy_pass http://localhost:3000;\n\
#         proxy_set_header Host $host;\n\
#         proxy_set_header X-Real-IP $remote_addr;\n\
#         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n\
#         proxy_set_header X-Forwarded-Proto $scheme;\n\
#     }\n\
# }' > /etc/nginx/sites-available/default

# # Expose ports 80 and 3001 to the host
# EXPOSE 80 3001

EXPOSE 3000

# Ensure Nginx starts with the container
ENTRYPOINT ["/bin/bash", "-c", "/app/container-setup/start.sh"]

CMD ["/bin/bash"]