ufw:
  pkg:
    - installed
  service:
    - running
    - require:
      - cmd: ufw-enable

# Enable
ufw-enable:
  cmd.run:
    - name: ufw --force enable
    - require:
      - pkg: ufw

# SSH
ufw-ssh:
  cmd.run:
    - name: ufw allow ssh
    - require:
      - pkg: ufw

#HTTP
ufw-http:
  cmd.run:
    - name: ufw allow http
    - require:
      - pkg: ufw
    - watch_in:
      - service: ufw


ufw-docker:
  cmd.run:
    - name: ufw allow proto tcp from 172.17.0.0/16 to 172.17.0.1 port 2375
    - require:
      - pkg: ufw
    - watch_in:
      - service: ufw



    
#/root/ufw.sh:
#  file:
#    - managed
#    - source: salt://security/file/ufw.sh
#    - name: /root/ufw.sh
#    - makedirs: True
#    - user: root
#    - group: root
#    - mode: 700
#  cmd:
#    - run
#    - require:
#      - pkg: ufw
