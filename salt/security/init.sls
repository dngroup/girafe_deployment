ufw:
  pkg:
    - installed
    
    
/root/ufw.sh:
  file:
    - managed
    - source: salt://security/file/ufw.sh
    - name: /root/ufw.sh
    - makedirs: True
    - user: root
    - group: root
    - mode: 700
  cmd:
    - run
    - require:
      - pkg: ufw
