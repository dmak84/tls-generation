set dir=%1
set csr.conf=%2

echo %csr.conf%
mkdir %dir%

openssl genrsa -out %dir%\tls.key 2048

openssl req -new -nodes -key %dir%\tls.key -out %dir%\tls.csr -config %csr.conf%

openssl x509 -req -in %dir%\tls.csr -CA ca\ca.crt -CAkey ca\ca.key -CAcreateserial -out %dir%\tls.crt -days 365 -sha256 -extfile %csr.conf% -extensions v3_req
