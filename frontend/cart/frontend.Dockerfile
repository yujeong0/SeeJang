FROM node:lts-alpine as build-stage
WORKDIR /s04p13d109/frontend/cart
COPY package*.json ./

RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine as production-stage
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /s04p13d109/frontend/cart/dist /usr/share/nginx/html/shopping
COPY ./nginx/fullchain.pem /usr/share/nginx/html/shopping/fullchain.pem
COPY ./nginx/privkey.pem /usr/share/nginx/html/shopping/privkey.pem;

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
