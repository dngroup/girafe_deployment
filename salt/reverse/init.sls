apache2:
  pkg:
    - installed
  file:
    - managed
    - source: salt://reverse/file/girafe.conf
    - name: /etc/apache2/sites-available/girafe.conf
    - template: jinja
    - makedirs: True
    - user: root
    - group: root
    - mode: 666


Enable modules:
  apache_module.enabled:
    - name: proxy_http rewrite headers

#/etc/apache2/sites-available/girafe.conf:
#  apache.configfile:
#    - config:
#      - VirtualHost:
#          this: '*:80'
#          ServerName:
#            - http://demo-girafe.nextnet.top/
#          ProxyPreserveHost: On
#          ProxyRequests: off
#          ProxyPass: /s1 http://localhost:9002/
#          ProxyPass: /s2 http://localhost:9003/
#          ProxyPass: / http://localhost:9000/
#          ProxyPassReverse: / http://localhost:9000/

dis defaut site:
  apache_site.disabled:
    - name: 000-default.conf 

Enable girafe site:
  apache_site.enabled:
    - name: girafe.conf 


sudo apache2ctl restart:
  cmd.run


