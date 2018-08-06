# ANSIBLE INSTALLATION (CENTOS)

[Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)


## OVERALL INFO

> Once Ansible is installed, it will not add a database, and there will be no daemons to start or keep running.

> When Ansible manages remote machines, it does not leave software installed or running on them, so there’s no real question about how to upgrade Ansible when moving to a new version.



## REQUIREMENTS

By default, Ansible uses the python interpreter located at `/usr/bin/python` to run its modules. 
However, some Linux distributions may only have a Python 3 interpreter installed to `/usr/bin/python3` by default.

### Control Machine Requirements

Currently Ansible can be run from any machine with Python 2 (versions 2.6 or 2.7) or Python 3 (versions 3.5 and higher) installed (Windows isn’t supported for the control machine).

Check installed Python version
```
python -V

      Python 2.7.5
```

Install necessary Python version if it doesn't meet requirements.


### Remote Machine Requirements

On the managed nodes, you need a way to communicate, which is normally ssh. By default this uses sftp. If that’s not available, you can switch to scp in ansible.cfg. 

You also need Python 2 (version 2.6 or later) or Python 3 (version 3.5 or later).

Check installed Python version
```
python -V

      Python 2.7.5
```

Install necessary Python version if it doesn't meet requirements.


### Configure necessary package repo

To enable the Ansible Engine repository, run the following command:
```
sudo subscription-manager repos --enable rhel-7-server-ansible-2.6-rpms
```



## INSTALLATION

**Approach #1: From the repo**

On the Control Machine
```
sudo yum install -y ansible
```


**Approach #2: Build from the source**

On the Control Machine
```
git clone https://github.com/ansible/ansible.git
cd ./ansible
make rpm
sudo rpm -Uvh ./rpm-build/ansible-*.noarch.rpm
```
































