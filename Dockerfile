# Etapa 1: Construção do projeto Angular
FROM node:18-alpine AS build

WORKDIR /app

# Instalar dependências
COPY package.json package-lock.json ./
RUN npm install

# Copiar o código do projeto
COPY . .

# Build da aplicação Angular
RUN npm run build --prod

# Etapa 2: Configurar o servidor Nginx para servir a aplicação Angular
FROM node:18-alpine

WORKDIR /app

# Copiar os arquivos buildados do Angular para o Nginx
COPY --from=build /app/dist/hotelbridge-frontend ./dist/hotelbridge-frontend

# Instalar Angular CLI globalmente (opcional, se você usar ng serve)
RUN npm install -g @angular/cli

# Expor a porta 80 para acessar a aplicação
EXPOSE 4200

# Comando de entrada para iniciar o Nginx
CMD ["npx", "ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
