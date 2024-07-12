FROM eclipse-mosquitto:latest
COPY ./config/mosquitto.conf /mosquitto/config/mosquitto.conf
COPY ./certs/server.crt /mosquitto/config/certs/server.crt
COPY ./certs/server.key /mosquitto/config/certs/server.key
COPY ./certs/ca.crt /mosquitto/config/certs/ca.crt
EXPOSE 8883