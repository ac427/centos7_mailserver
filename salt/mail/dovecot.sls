
{{ mail.dovecot_config }} :
  file.managed:
    - source: salt://mail/files/etc/dovecot/dovecot.conf 
    - template: jinja
    - mode: 644
    - user: root
    - group: root

{{ mail.dovecot_conf_dir }}/10-master.conf:
  file.managed:
    - source: salt://mail/files/etc/dovecot/conf.d/10-master.conf 
    - mode: 644
    - template: jinja
    - user: root
    - group: root

{{ mail.dovecot_conf_dir }}/10-auth.conf:
  file.managed:
    - source: salt://mail/files/etc/dovecot/conf.d/10-auth.conf
    - mode: 644
    - template: jinja
    - user: root
    - group: root

{{ mail.dovecot_conf_dir }}/10-mail.conf:
  file.managed:
    - source: salt://mail/files/etc/dovecot/conf.d/10-mail.conf
    - mode: 644
    - template: jinja
    - user: root
    - group: root

{{ mail.dovecot_conf_dir }}/10-ssl.conf:
  file.managed:
    - source: salt://mail/files/etc/dovecot/conf.d/10-ssl.conf
    - mode: 644
    - template: jinja
    - user: root
    - group: root

