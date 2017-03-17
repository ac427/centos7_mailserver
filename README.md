# centos7_mailserver (postfix+dovecot+spamassassin)

### Below are my steps I ran to test on AWS
 - Purchase domain name ( $12/year + elastic ip + ec2)
 ```
 # for setting route53
 https://elprespufferfish.net/blog/aws,mail/2015/09/03/mail-server-ec2.html
 
 ```
 - Setup A and MX records on route53 
 - open inbound ports for mail (995+993+25+465) in AWS security groups & also any firewalls you are running 
 - get free cert from certbot or create self signed 

   ```
   # Steps to create cert and self sign

    mkdir -p /etc/pki/tls/certs/example/
    cd /etc/pki/tls/certs/example/ 
    umask 77 ; /usr/bin/openssl genrsa -aes128 2048 > server.key
    openssl rsa -in server.key -out server.key 
    umask 77 ; /usr/bin/openssl req -utf8 -new -key server.key -out server.csr
    openssl x509 -in server.csr -out server.crt -req -signkey server.key -days 3650
    
    ```
    
    ### credits 
    
    https://certbot.eff.org      
    
    https://www.server-world.info/en/note?os=CentOS_7&p=mail&f=4 
    
    https://elprespufferfish.net/blog/aws,mail/2015/09/03/mail-server-ec2.html 
    
