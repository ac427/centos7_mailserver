
postfix_main_config:
  file.managed:
    - name: {{ mail.postfix_main_config}} 
    - source: salt://mail/files/etc/postfix/main.cf
    - template: jinja
    - mode: 644
    - user: root
    - group: root

postfix_master_config:
  file.managed:
    - name: {{ mail.postfix_master_config}}
    - source: salt://mail/files/etc/postfix/master.cf
    - template: jinja
    - mode: 644
    - user: root
    - group: root

