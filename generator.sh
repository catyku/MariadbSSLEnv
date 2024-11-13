#!/bin/bash
cd ssl
echo "01" > ca.srl
# CA key
echo '123'
openssl genrsa 2048 > ca-key.pem
echo '1234'
openssl req -new -x509 -nodes -days 3600 -key ca-key.pem -out ca-cert.pem --config ../ca.conf
echo '1235'
# server key
openssl req -newkey rsa:2048 -days 3600 -nodes -keyout server-key.pem -out server-req.pem --config ../server.conf
echo '126'
openssl rsa -in server-key.pem -out server-key.pem
echo '1237'
openssl x509 -req -in server-req.pem -days 3600 -CA ca-cert.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem -extfile ../server.conf
echo '1238'
# client key
echo '1239'
openssl req -newkey rsa:2048  -nodes -keyout client-key.pem -out client-req.pem --config ../client.conf
echo '12310'
openssl rsa -in client-key.pem -out client-key.pem
echo '12311'
openssl x509 -req -in client-req.pem -days 3600 -CA ca-cert.pem -CAkey ca-key.pem -set_serial 01 -out client-cert.pem
echo '12312'
# check key ok
openssl verify -CAfile ca-cert.pem server-cert.pem client-cert.pem
cd ..
