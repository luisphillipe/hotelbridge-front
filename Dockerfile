# Etapa 1: Constru��o do projeto Angular
FROM node:18-alpine AS build

WORKDIR /app

# Instalar depend�ncias
COPY package.json package-lock.json ./
RUN npm install

# Copiar o c�digo do projeto
COPY . .

# Build da aplica��o Angular
RUN npm run build --prod

# Etapa 2: Configurar o servidor Nginx para servir a aplica��o Angular
FROM node:18-alpine

WORKDIR /app

# Copiar os arquivos buildados do Angular para o Nginx
COPY --from=build /app/dist/hotelbridge-frontend ./dist/hotelbridge-frontend

# Instalar Angular CLI globalmente (opcional, se voc� usar ng serve)
RUN npm install -g @angular/cli

# Expor a porta 80 para acessar a aplica��o
EXPOSE 4200

# Comando de entrada para iniciar o Nginx
CMD ["npx", "ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
