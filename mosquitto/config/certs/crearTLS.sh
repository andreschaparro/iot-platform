#!/bin/bash

HOSTNAME="raspberrypi.local"
SUBJECT_CA="/C=AR/ST=AMBA/L=Municipio/O=Empresa/OU=CA/CN=$HOSTNAME"
SUBJECT_SERVER="/C=AR/ST=AMBA/L=Municipio/O=Empresa/OU=Server/CN=$HOSTNAME"
SUBJECT_CLIENT="/C=AR/ST=AMBA/L=Municipio/O=Empresa/OU=Client/CN=$HOSTNAME"

function generate_CA () {
    echo "$SUBJECT_CA"
    openssl req -x509 -nodes -sha256 -newkey rsa:2048 -subj "$SUBJECT_CA"  -days 825 -keyout ca.key -out ca.crt
    openssl x509 -in ca.crt -text -noout
}

function generate_server () {
    echo "$SUBJECT_SERVER"
    openssl req -nodes -sha256 -new -subj "$SUBJECT_SERVER" -keyout server.key -out server.csr
    openssl x509 -req -sha256 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 825
    openssl x509 -in server.crt -text -noout
    openssl verify -CAfile ca.crt server.crt
}

function generate_client () {
    echo "$SUBJECT_CLIENT"
    openssl req -new -nodes -sha256 -subj "$SUBJECT_CLIENT" -out client.csr -keyout client.key 
    openssl x509 -req -sha256 -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 825
    openssl x509 -in client.crt -text -noout
    openssl verify -CAfile ca.crt client.crt
}

generate_CA
generate_server
generate_client