# girafedeployment



```
# get ssh key on girafe-ixp-data-extractor or create your key 
git clone https://github.com/dngroup/girafedeployment.git
cd girafedeployment
# pillar value is the default value
sudo salt-call --local --file-root=$(pwd)/salt state.highstate pillar="{'publicaddr': 'http://demo-girafe.nextnet.top/', 'id_rsa': '/root/.ssh/id_rsa', 'outfloder':'/var/www/girafe-data'}"
```

``` 
#Girafe data extractor need time to launch (with crontab 1 day) but need near 2h if we do "compile" "peeringdb extractor" "webupdate" and "mv out folder"
sudo crontab -l # to get command to launch
```


## install salt

generic (https://repo.saltstack.com/)
```
sudo apt-get update && apt-get install git curl -y
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P
```

