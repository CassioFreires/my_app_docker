ARG NODE_VERSION=24.15.0

FROM node:${NODE_VERSION}

ENV PORT=8080
ENV MESSAGE="Hello Docker!"

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN  npm run build

RUN useradd -m mynode

RUN chown -R mynode:mynode /app

USER mynode

HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=3 \
CMD ["curl", "-f", "http://localhost:8080/health"]

CMD ["node", "dist/src/index.js"]