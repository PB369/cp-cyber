# Use a imagem oficial do Python 3.10
FROM python:3.10-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie os arquivos de requirements primeiro para aproveitar cache do Docker
COPY requirements.txt .

# Instale as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copie todo o restante da aplicação
COPY . .

# Exponha a porta que a aplicação usa
EXPOSE 8080

# Comando padrão para rodar a aplicação
CMD ["python", "app.py"]
