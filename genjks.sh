jks=$1

keytool -genkey -alias $jks -keyalg RSA -keysize 2048 -keystore $jks
