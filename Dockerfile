FROM node:12-alpine as builder
ENV http_proxy 'http://inetgw.aa.com:9090'
ENV https_proxy 'http://inetgw.aa.com:9090'
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
ENV http_proxy 'http://inetgw.aa.com:9090'
ENV https_proxy 'http://inetgw.aa.com:9090'
COPY --from=builder /app/build /usr/share/nginx/html


