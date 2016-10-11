# girafedeployment



```
# get ssh key on girafe-ixp-data-extractor or create your key 
git clone https://github.com/dngroup/girafedeployment.git
cd girafedeployment
# pillar value is the default value
sudo salt-call --local --file-root=$(pwd)/salt state.highstate pillar="{'publicaddr': 'http://demo-girafe.nextnet.top/', 'id_rsa': '/root/.ssh/id_rsa', 'user': $USER, 'outfloder':'/var/www/girafe-data'}"
```


## install salt

```
apt-get install git curl -y
```
generic (https://repo.saltstack.com/)
```
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P
```
ubuntu 16
```
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list
sudo apt-get update
sudo apt-get install salt-common
```
