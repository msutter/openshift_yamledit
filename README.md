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

## Usage


