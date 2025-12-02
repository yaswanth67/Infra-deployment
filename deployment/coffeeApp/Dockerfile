FROM node:22-alpine

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --omit=dev
COPY dist ./dist
COPY public ./public
EXPOSE 3000
CMD ["node", "dist/bundle.js"]