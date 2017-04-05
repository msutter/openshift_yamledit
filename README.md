Openshift YamlEdit
============================

## Overview

Little scripts to edit configuration files on openshift master, infra and node hosts with ansible.

This asumes you already have configured your ansible hosts file.

## Install yamledit on all hosts

```
ansible all -m copy -a "src=./install_rhel7.sh dest=~/install_rhel7.sh mode=755"
ansible all -m command -a "~/install_rhel7.sh"
```

## Usage Example

As example we change a value in the master-config.yaml file for each master

```
file=/etc/origin/master/master-config.yaml
key=projectConfig.projectRequestMessage
value='Please create project using the portal or contact admin@example.com'

# list entry
ansible masters -m command -a "/usr/local/sbin/yamledit -f ${file} -g ${key}"

# update entry
ansible masters -m command -a "/usr/local/sbin/yamledit -y -f ${file} -o ${file} -r ${key} '${value}'"

# restart master services
ansible masters -m command -a 'systemctl restart atomic-openshift-master-controllers'
ansible masters -m command -a 'systemctl restart atomic-openshift-master-api'
```



