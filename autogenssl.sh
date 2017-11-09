#!/bin/bash

country="US"
state="UTAH"
city="SANTA CLARA"
org="HAYNIE RESEARCH AND DEVELOPMENT LLC"
unit="INFORMATION SECURITY"

sslbin=/usr/bin/openssl
catbin=/bin/cat

file=$1
name=$2

$sslbin genrsa -out $file.key 4096
$sslbin req -new -x509 -key $file.key -out $file.crt -subj "/C=$country/ST=$state/L=$city/O=$org/OU=$unit/CN=$name" -days 3650
$catbin $file.key $file.crt >> $file.cer
exit 0
