FROM mcr.microsoft.com/devcontainers/base:noble

WORKDIR /app

ENV VERSION=20.11.0
ENV COMMIT=81328b61d2a4ab597a7a057be70e785cf756d9f8

COPY install-node.sh /app/
COPY setup-chatbot-ui.sh /app/

RUN chmod +x /app/install-node.sh
RUN chmod +x /app/setup-chatbot-ui.sh

RUN /app/install-node.sh
RUN /bin/bash -c "source /usr/local/share/nvm/nvm.sh && /app/setup-chatbot-ui.sh"


CMD ["/bin/bash"]