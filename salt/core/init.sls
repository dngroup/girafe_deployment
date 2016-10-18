#/etc/systemd/system/docker.service.d/docker-defaults.conf:
#  file:
#    - managed
#    - source: salt://core/file/docker-defaults.conf
#    - template: jinja
#    - makedirs: True
#    - user: root
#    - group: root
#    - mode: 750

/etc/default/docker:
  file:
    - managed
    - source: salt://core/file/docker
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 644

docker:
  service.running:
    - enable: True

#/etc/systemd/system/docker-tcp.socket:
#  file:
#    - managed
#    - source: salt://core/file/docker-tcp.socket
#    - template: jinja
#    - makedirs: True
#    - user: root
#    - group: root
#    - mode: 644
#  cmd.run:
#    - name: systemctl daemon-reload
#    - onchanges:
#      - file: /etc/systemd/system/docker-tcp.socket
#
#
#systemctl enable docker-tcp.socket:
#  cmd.run:
#    - onchanges:
#      - file: /etc/systemd/system/docker-tcp.socket


# getting configuration
git:
  pkg:
    - installed

git girafe:
  git.latest:
    - name: https://github.com/dngroup/girafe.git
    - target: /etc/girafe
    - force_reset: True
    - force_checkout: true
    - depth: 1
    - require:
      - pkg: git
#    - unless:
#      - cd /etc/girafe
/etc/girafe/docker/composer/application.env:
  file:
    - managed
    - source: salt://core/file/application.env
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 666


# creating service girafe
# don't use /etc/systemd/user folder as say on github but system like do on girafe server
/etc/systemd/system/girafe.service:
  file:
    - managed
    - source: salt://core/file/girafe.service
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: /etc/systemd/system/girafe.service



systemctl enable girafe:
  cmd.run:
    - name: systemctl enable girafe
    - onchanges:
      - file: /etc/systemd/system/girafe.service
#
#systemctl stop docker:
#  cmd.run:
#    - onchanges:
#      - file: /etc/systemd/system/girafe.service
#
#
#systemctl start docker.socket:
#  cmd.run:
#    - name: systemctl start docker.socket
#    - onchanges:
#      - file: /etc/systemd/system/girafe.service
#
#systemctl enable docker.socket:
#  cmd.run:
#    - name: systemctl enable girafe
#    - onchanges:
#      - file: /etc/systemd/system/girafe.service
#
#
#systemctl start docker-tcp.socket:
#  cmd.run:
#    - onchanges:
#      - file: /etc/systemd/system/docker-tcp.socket
#
#systemctl enable docker-tcp.socket:
#  cmd.run:
#    - onchanges:
#      - file: /etc/systemd/system/docker-tcp.socket
#
systemctl start girafe:
  cmd.run:
    - name: systemctl start girafe
    - onchanges:
      - file: /etc/systemd/system/girafe.service








#/root/girafe.yaml:
#  file.managed:
#    - name: /etc/girafe/girafe.yaml
#    - source: https://raw.githubusercontent.com/dngroup/girafe/master/docker/composer/girafe.yaml
#    - skip_verify: True
#    - makedirs: True
#    - user: root
#    - group: root
#    - mode: 666
    


#systemctl daemon-reload:
#  cmd.run
#
#service docker restart:
#  cmd.run

include:
  - .simu-dockermgt
  - .simu-serverapache
  - .simu-sessionmgt
