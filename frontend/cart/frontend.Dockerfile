FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./

RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine as production-stage
# COPY ./nginx/nginx.conf /etc/nginx/conf.d
COPY --from=build-stage ./app/dist nginx:/usr/share/nginx/html/shopping
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
