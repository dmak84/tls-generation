cert_dir=$1
jks=$2

openssl pkcs12 -export -name $cert_dir -in $cert_dir\tls.crt -inkey $cert_dir\tls.key -out temp.p12

keytool -importkeystore -srckeystore temp.p12 -destkeystore $jks -srcstoretype pkcs12

del temp.p12
