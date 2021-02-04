FROM node:lts-alpine as build-stage
WORKDIR /s04p13d109/frontend/cart
COPY package*.json ./

RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine as production-stage
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./dist /usr/share/nginx/html/shopping

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
