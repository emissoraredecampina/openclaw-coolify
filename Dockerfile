FROM node:22-slim

WORKDIR /app

# Instala o OpenClaw CLI
RUN npm install -g openclaw@latest

# Diretório persistente
ENV OPENCLAW_HOME=/data/openclaw
RUN mkdir -p /data/openclaw

VOLUME ["/data/openclaw"]

EXPOSE 18789

CMD ["openclaw", "gateway", "--port", "18789", "--verbose"]
