apache2:
  pkg:
    - installed


Enable modules:
  apache_module.enabled:
    - name: proxy_http
  apache_module.enabled:
    - name: rewrite

/etc/apache2/sites-available/website.conf:
  apache.configfile:
    - config:
      - VirtualHost:
          this: '*:80'
          ServerName:
            - http://demo-girafe.nextnet.top/
          ProxyPreserveHost: On
          ProxyRequests: off
          ProxyPass:  / http://localhost:9000/
          ProxyPassReverse: / http://localhost:9000/

