FROM nginx:latest
COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./certs/server.crt /etc/nginx/certs/server.crt
COPY ./certs/server.key /etc/nginx/certs/server.key
COPY ./certs/ca.crt /etc/nginx/certs/ca.crt
COPY ./updates /usr/share/nginx/html/updates
EXPOSE 8443