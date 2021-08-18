set dir=%1
echo %dir%
mkdir %dir%

openssl x509 -req -in %dir%/tls.csr -CA ca/ca.crt -CAkey ca/ca.key -CAcreateserial -out %dir%/tls.crt -days 365 -extfile %csr.conf%