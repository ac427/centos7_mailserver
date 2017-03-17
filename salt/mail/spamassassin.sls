{{ mail.spamfilter_user }}:
  user.present:
    - fullname: spamassassin
    - shell: /bin/bash
    - home: {{ spamfilter_home }} 
    - system: True
    - shell: /bin/false

{{ mail.spamassassin_config }}: 
  file.managed:
    - source: salt://mail/files/etc/mail/spamassassin/local.cf
    - mode: 644
    - template: jinja
    - user: root
    - group: root

