FROM node:20-slim

WORKDIR /app

# Instala dependências básicas do sistema
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

# Instala o OpenClaw globalmente
RUN npm install -g openclaw@latest --unsafe-perm

# Cria o diretório de dados e define permissões
RUN mkdir -p /data/openclaw
ENV OPENCLAW_HOME=/data/openclaw

VOLUME ["/data/openclaw"]

EXPOSE 18789

# Comando para iniciar o gateway
CMD ["openclaw", "gateway", "--port", "18789", "--verbose"]
