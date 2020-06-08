FROM node:carbon
WORKDIR /usr/app/src
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080