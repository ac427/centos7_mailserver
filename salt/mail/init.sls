{% from "mail/map.jinja" import map with context %}

{% if salt['pillar.get']('packages', {}) !=  {} %}
packages:
  pkg.installed:
    - pkgs:
{% for pkg in salt['pillar.get']('packages', {}) %}
      - {{ pkg }}
{% endfor %}
{% endif %}


postfix_main_config:
  file.managed:
    - name: {{ map.postfix_main_config}} 
    - source: salt://mail/files/etc/postfix/main.cf
    - template: jinja
    - mode: 644
    - user: root
    - group: root


postfix_master_config:
  file.managed:
    - name: {{ map.postfix_master_config}}
    - source: salt://mail/files/etc/postfix/master.cf
    - template: jinja
    - mode: 644
    - user: root
    - group: root


{{ map.dovecot_config }} :
  file.managed:
    - source: salt://mail/files/etc/dovecot/dovecot.conf 
    - template: jinja
    - mode: 644
    - user: root
    - group: root

{{ map.dovecot_conf_dir }}/10-master.conf:
  file.managed:
    - source: salt://mail/files/etc/dovecot/conf.d/10-master.conf 
    - mode: 644
    - template: jinja
    - user: root
    - group: root

{{ map.dovecot_conf_dir }}/10-auth.conf:
  file.managed:
    - source: salt://mail/files/etc/dovecot/conf.d/10-auth.conf
    - mode: 644
    - template: jinja
    - user: root
    - group: root

{{ map.dovecot_conf_dir }}/10-mail.conf:
  file.managed:
    - source: salt://mail/files/etc/dovecot/conf.d/10-mail.conf
    - mode: 644
    - template: jinja
    - user: root
    - group: root

{{ map.dovecot_conf_dir }}/10-ssl.conf:
  file.managed:
    - source: salt://mail/files/etc/dovecot/conf.d/10-ssl.conf
    - mode: 644
    - template: jinja
    - user: root
    - group: root

{{ salt['pillar.get']('spamfilter_user') }}:
  user.present:
    - fullname: spamassassin
    - shell: /bin/bash
    - home: {{ salt['pillar.get']('spamfilter_home') }} 
    - system: True
    - shell: /bin/false

{{ map.spamassassin_config }}: 
  file.managed:
    - source: salt://mail/files/etc/mail/spamassassin/local.cf
    - mode: 644
    - template: jinja
    - user: root
    - group: root

reload postfix:
  service.running:
    - name: postfix
    - reload: True
    - watch:
      - file: /etc/postfix/*.cf

reload dovecot:
  service.running:
    - name: dovecot
    - reload: True
    - watch:
      - file: /etc/dovecot/conf.d/*.conf

reload spamassassin:
  service.running:
    - name: postfix
    - reload: True
    - watch:
      - file: /etc/mail/spamassassin/*.cf
