logdir:
  file.directory:
    - name: /var/log/girafe
    - user: root
    - group: root
    - dir_mode: 777
    - file_mode: 666
    - recurse:
      - user
      - group
      - mode


extract:
  cron.present:
    - name: docker run -v {{ salt['pillar.get']('id_rsa', '/root/.ssh/id_rsa') }}:/root/id_rsa  dngroup/girafe-ixp-data-extractor ./extract.sh >>/var/log/girafe/extract 2>&1
    - minute: 0
    - hour: '*/4'
    - user: {{ salt['pillar.get']('user', 'root') }}

compile:
  cron.present:
    - name: docker run -v {{ salt['pillar.get']('id_rsa', '/root/.ssh/id_rsa') }}:/root/id_rsa -v {{ salt['pillar.get']('outfloder', '/var/www/girafe-data') }}:/root/tohost/girafe-ixp-data-extractor  dngroup/girafe-ixp-data-extractor ./compile.sh >>/var/log/girafe/compile 2>&1
    - minute: 30
    - hour: '1'
    - user: {{ salt['pillar.get']('user', 'root') }}

webupdate:
  cron.present:
    - name: docker run -v {{ salt['pillar.get']('id_rsa', '/root/.ssh/id_rsa') }}:/root/id_rsa -v {{ salt['pillar.get']('outfloder', '/var/www/girafe-data') }}:/root/tohost/girafe-ixp-data-extractor  dngroup/girafe-ixp-data-extractor ./docker/webupdate.sh >>/var/log/girafe/webupdate 2>&1
    - minute: 30
    - hour: '2'
    - user: {{ salt['pillar.get']('user', 'root') }}

mv out folder:
  cron.present:
    - name: cp -r {{ salt['pillar.get']('outfloder', '/var/www/girafe-data') }}/out {{ salt['pillar.get']('outfloder', '/var/www/girafe-data') }}/web >>/var/log/girafe/mv 2>&1
    - minute: 30
    - hour: '3'
    - user: {{ salt['pillar.get']('user', 'root') }}

peeringdb extractor:
  cron.present:
    - name: docker run -v {{ salt['pillar.get']('id_rsa', '/root/.ssh/id_rsa') }}:/root/id_rsa  dngroup/girafe-ixp-data-extractor ./ixp.sh  >>/var/log/girafe/peeringdb 2>&1
    - minute: 0
    - hour: '2'
    - user: {{ salt['pillar.get']('user', 'root') }}
