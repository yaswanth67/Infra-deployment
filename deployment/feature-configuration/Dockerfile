FROM node:22-alpine

WORKDIR /usr/src/app
COPY app/. .
RUN npm ci --omit=dev

EXPOSE 8080
CMD ["npm", "start"]