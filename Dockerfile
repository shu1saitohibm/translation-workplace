FROM registry.access.redhat.com/ubi7/nodejs-14 as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM registry.access.redhat.com/ubi7/nginx-118
COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf