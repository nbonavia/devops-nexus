#/bin/bash

keytool -genkey -alias leoventures -storetype PKCS12 -dname "CN=localhost,OU=LeoVentures,O=LeoVegas,L=Sliema,C=MT,EMAILADDRESS=nexus@leovegas.com" -ext SAN=dns:localhost -keyalg RSA -keysize 2048 -keystore local.p12 -storepass avRGrehlYQraAXoE -validity 3650

keytool -importkeystore -srckeystore ./local.p12 -srcstoretype pkcs12 -srcalias leoventures -destkeystore ./local.jks -deststoretype jks -deststorepass avRGrehlYQraAXoE -destalias leoventures