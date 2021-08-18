mkdir ca

openssl genrsa -out ca/ca.key 2048

openssl req -x509 -new -nodes -key ca/ca.key -subj "/CN=opentlc.com/C=US/L=CALIFORNIA" -days 1825 -out ca/ca.crt