FROM node:latest

WORKDIR /app

COPY package*.json ./

RUN npm install -g typescript

COPY . .

RUN run build

CMD ["node", "dist/src/index.js"]