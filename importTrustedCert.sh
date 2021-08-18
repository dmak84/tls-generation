alias=$1
crt=$2
keystore=$3

keytool -import -alias $alias -file $crt -keystore $keystore