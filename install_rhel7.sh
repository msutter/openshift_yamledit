#!/bin/bash
# install yamledit to be used with ansible to update yaml files
# this must be done on your master, infra and node hosts
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y ./epel-release-latest-7.noarch.rpm
yum -y install python-pip
pip install ruamel.yaml
if [ ! -d yamledit ]
  then
  git clone https://github.com/microtodd/yamledit.git
fi
if [ ! -f /usr/local/sbin/yamledit ]
  then
  echo '#!/bin/python' | cat - yamledit/yamledit.py > /usr/local/sbin/yamledit
  chmod a+x /usr/local/sbin/yamledit
fi
