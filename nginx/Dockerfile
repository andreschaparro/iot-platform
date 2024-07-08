FROM nginx:latest
COPY ./config/certs/server.crt /etc/nginx/certs/server.crt
COPY ./config/certs/server.key /etc/nginx/certs/server.key
COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./updates /usr/share/nginx/html/updates
EXPOSE 8443