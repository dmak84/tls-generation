set cert-dir=%1
set jks=%2

openssl pkcs12 -export -name %cert-dir% -in %cert-dir%/tls.crt -inkey %cert-dir%/tls.key -out temp.p12

keytool -importkeystore -srckeystore temp.p12 -destkeystore %jks% -srcstoretype pkcs12

del temp.p12

