/etc/systemd/system/docker.service.d/docker-defaults.conf:
  file:
    - managed
    - source: salt://core/file/docker-defaults.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 666
    
/etc/systemd/user/girafe.service :
  file:
    - managed
    - source: salt://core/file/girafe.service
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 666

/root/girafe.yaml:
  file.managed:
    - name: /root/girafe.yaml
    - source: https://raw.githubusercontent.com/dngroup/girafe/master/docker/composer/girafe.yaml
    - makedirs: True
    - user: root
    - group: root
    - mode: 666
    
/root/application.env:
  file:
    - managed
    - source: salt://core/file/application.env
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 666

systemctl daemon-reload:
  cmd.run




include:
  - .simu-dockermgt
  - .simu-serverapache
  - .simu-sessionmgt
