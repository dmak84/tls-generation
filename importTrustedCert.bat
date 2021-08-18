set alias=%1
set crt=%2
set keystore=%3

keytool -import -alias %alias% -file %crt% -keystore %keystore%