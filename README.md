
# create Self-Signed CA cert
create a ca folder to hold the ca.key and ca.crt

run ca.bat

# create server cert
create a server folder to hold the server key and cert, using the ca certs created in the ca folder

The server folder holding the server key and certs

The server-csr.conf is the cert sign request configuration, modify the contents accordingly, specifically for the dns name that matched your AMQ deployed in the OCP cluser

e.g.
```
[ alt_names ]
DNS.1 = broker1-artemis-*-svc
DNS.2 = broker1-artemis-*-svc.amq.svc
DNS.3 = broker1-artemis-*-svc.amq.svc.cluster.local
DNS.4 = broker1-artemis-*-svc-amq.apps.ocp-opentlc.com

```

ssl.bat server server-csr.conf

# create client cert
create a client folder to hold the client key and cert, using the ca certs created in the ca folder

The client folder holding the client key and certs

ssl.bat client client-csr.conf

# Generate JKS in the secret folder

## Generate JKS for the broker and client
cd secret

Generate broker.ks

../genjks.bat broker.ks


Generate client.ts

../genjks.bat client.ts

# import private key and certificate in broker JKS
Import the private key and certificate stored in the folder server to the Jks secret\broker.jks

importKeyPair.bat server secret\broker.jks

# import trust certificate to client.ts
The first argument is the alias of the certificate

importTrustedCert.bat caroot ca\tls.crt secret\client.ts

importTrustedCert.bat client client\tls.crt secret\client.ts


# create broker1-jks secret

oc create secret generic broker1-jks --from-file=broker.ks --from-file=client.ts --from-literal=trustStorePassword=redhat --from-literal=keyStorePassword=redhat