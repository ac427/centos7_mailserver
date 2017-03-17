ssl_key: /etc/pki/tls/certs/example/server.key
ssl_cert: /etc/pki/tls/certs/example/server.crt
domain: example.com
hostname: mail
packages:
  - epel
  - vim
  - wget
  - bind-utils
  - screen
  - dovecot
  - postfix
  - spamassassin
spamfilter_user: spamfilter
spamfilter_home: /usr/local/spamassassin
