FROM eclipse-mosquitto:latest
COPY ./config/mosquitto.conf /mosquitto/config/mosquitto.conf
COPY ./config/certs/server.crt /mosquitto/config/certs/server.crt
COPY ./config/certs/server.key /mosquitto/config/certs/server.key
COPY ./config/certs/ca.crt /mosquitto/config/certs/ca.crt
EXPOSE 8883