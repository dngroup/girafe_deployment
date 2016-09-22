docker run -itv {{ salt['pillar.get']('id_rsa', '/root/.ssh/id_rsa') }}:/root/id_rsa  dngroup/girafe-ixp-data-extractor ./extract.sh:
  cron.present:
    - hour: '*/4'
    - user: {{ salt['pillar.get']('user', 'root') }}


docker run -itv {{ salt['pillar.get']('id_rsa', '/root/.ssh/id_rsa') }}:/root/id_rsa -v {{ salt['pillar.get']('outfloder', '/var/www/girafe-data') }}:/root/tohost/girafe-ixp-data-extractor  dngroup/girafe-ixp-data-extractor ./compile.sh:
  cron.present:
    - minute: 30
    - hour: '1'
    - user: {{ salt['pillar.get']('user', 'root') }}

docker run -itv {{ salt['pillar.get']('id_rsa', '/root/.ssh/id_rsa') }}:/root/id_rsa -v {{ salt['pillar.get']('outfloder', '/var/www/girafe-data') }}:/root/tohost/girafe-ixp-data-extractor  dngroup/girafe-ixp-data-extractor ./docker/webupdate.sh:
  cron.present:
    - minute: 30
    - hour: '2'
    - user: {{ salt['pillar.get']('user', 'root') }}

mv {{ salt['pillar.get']('outfloder', '/var/www/girafe-data') }}/out {{ salt['pillar.get']('outfloder', '/var/www/girafe-data') }}/web:
  cron.present:
    - minute: 30
    - hour: '3'
    - user: {{ salt['pillar.get']('user', 'root') }}

docker run -itv {{ salt['pillar.get']('id_rsa', '/root/.ssh/id_rsa') }}:/root/id_rsa  dngroup/girafe-ixp-data-extractor ./ixp.sh:
  cron.present:
    - hour: '2'
    - user: {{ salt['pillar.get']('user', 'root') }}
