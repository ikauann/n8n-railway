# Usa a imagem oficial do n8n, versão estável
FROM n8nio/n8n:latest

# ==================================================================
# --- INÍCIO DA MODIFICAÇÃO PARA INSTALAR O FFMPEG ---

# Mudar temporariamente para o usuário 'root' para ter permissão de instalar pacotes.
USER root

# Atualizar a lista de pacotes do sistema e instalar o ffmpeg.
# O '-y' confirma a instalação automaticamente.
# O '&& apt-get clean && rm ...' é uma boa prática para limpar o cache 
# e manter o tamanho final da imagem menor.
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean && rm -rf /var/lib/apt/lists/*

# Mudar de volta para o usuário 'node' padrão do n8n por segurança.
USER node

# --- FIM DA MODIFICAÇÃO ---
# ==================================================================

# Expõe a porta padrão do n8n
EXPOSE 5678
