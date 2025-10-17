# Imagem base oficial do Python
FROM python:3.10-slim

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar arquivos de dependências
COPY requirements.txt .

# Instalar as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do código da aplicação
COPY . .

# Expor a porta usada pelo app
EXPOSE 8080

# Definir a variável de ambiente do Flask (caso use Flask)
ENV FLASK_APP=app.py

# Comando para iniciar a aplicação
CMD ["python", "app.py"]
