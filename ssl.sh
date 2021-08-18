dir=$1
csr_conf=$2

echo $csr_conf
mkdir $dir

openssl genrsa -out $dir/tls.key 2048

openssl req -new -nodes -key $dir/tls.key -out $dir/tls.csr -config $csr_conf

openssl x509 -req -in $dir/tls.csr -CA ca/ca.crt -CAkey ca/ca.key -CAcreateserial -out $dir/tls.crt -days 365 -sha256 -extfile $csr_conf -extensions v3_req
