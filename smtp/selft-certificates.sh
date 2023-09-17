#! /bin/sh
mkdir -p ./storage/mail-server/certs/

step certificate create "Smallstep Root CA" "./storage/mail-server/certs/cacert.pem" "./storage/mail-server/certs/cakey.pem" \
  --no-password --insecure \
  --profile root-ca \
  --not-before "2023-01-01T00:00:00+00:00" \
  --not-after "2033-01-01T00:00:00+00:00" \
  --san "udistritalredescorporativas.lan" \
  --san "mail.udistritalredescorporativas.lan" \
  --kty RSA --size 2048

step certificate create "Smallstep Leaf" mail.udistritalredescorporativas.lan.test-cert.pem mail.udistritalredescorporativas.lan.test-key.pem \
  --no-password --insecure \
  --profile leaf \
  --ca "./storage/mail-server/certs/cacert.pem" \
  --ca-key "./storage/mail-server/certs/cakey.pem" \
  --not-before "2021-01-01T00:00:00+00:00" \
  --not-after "2031-01-01T00:00:00+00:00" \
  --san "udistritalredescorporativas.lan" \
  --san "mail.udistritalredescorporativas.lan" \
  --kty RSA --size 2048