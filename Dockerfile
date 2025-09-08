# Usa a imagem oficial do n8n, versão estável
FROM n8nio/n8n:latest

# ==================================================================
# --- INÍCIO DA MODIFICAÇÃO PARA INSTALAR O FFMPEG ---

# Mudar temporariamente para o usuário 'root' para ter permissão de instalar pacotes.
USER root

# A imagem base usa Alpine Linux, então usamos o comando 'apk' em vez de 'apt-get'.
# O '--no-cache' atualiza os pacotes, instala o ffmpeg e limpa o cache em um só passo.
RUN apk add --no-cache ffmpeg

# Mudar de volta para o usuário 'node' padrão do n8n por segurança.
USER node

# --- FIM DA MODIFICAÇÃO ---
# ==================================================================

# Expõe a porta padrão do n8n
EXPOSE 5678
