# girafedeployment

```
sudo salt-call --local --file-root=$(pwd)/salt state.highstate pillar="{publicaddr: 'http://demo-girafe.nextnet.top/', bar: 'Bar!'}"
```


## install salt

```
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list
sudo apt-get update
sudo apt-get install salt-common
```
