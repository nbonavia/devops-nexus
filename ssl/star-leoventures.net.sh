#/bin/bash


openssl pkcs12 -export -inkey ./star_leoventures_net_private.pem -in ./star_leoventures_net_public.pem -CAfile ./star_leoventures_net_INT.pem -name leoventures -out prod.p12

keytool -importkeystore -srckeystore ./prod.p12 -srcstoretype pkcs12 -srcalias leoventures -destkeystore ./prod.jks -deststoretype jks -deststorepass avRGrehlYQraAXoE -destalias leoventures

openssl pkcs12 -nokeys -in keystore.p12 -out server-ca-cert-bundle.pem
openssl pkcs12 -nocerts -nodes -in keystore.p12 -out server.key