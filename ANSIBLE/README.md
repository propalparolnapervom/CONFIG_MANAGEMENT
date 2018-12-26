# ANSIBLE OVERALL

**Ansible** is a configuration management and orchestration tool.

Ansible can be run directly from the command line without setting up any configuration files. 

You only need to install Ansible on the control server or node. 

It communicates and performs the required tasks using SSH. 

No other installation is required. 

This is different from other orchestration tools like Chef and Puppet where you have to install software both on the control and client nodes.



**Control machine** − Machine from where we can manage other machines.

**Remote machine** − Machines which are handled/controlled by control machine.


## INVENTORY FILE

Information about remote machines (target systems) is stored in **Inventory file**.

If you don't create a new Inventory file, Ansible uses default one located at  `/etc/ansible/hosts`.


### INVENTORY EXAMPLES

Groups
```
cat /etc/ansible/hosts

#Groups of servers

[all]
control-host
remote-host

[ctl]
control-host

[rmt]
remote-host


#Group of groups

[all_servers:children]  #thanks to ":children" here we understand that this is a group of groups
ctl
rmt
```

Aliases
```
cat /etc/ansible/hosts

#Aliases for servers

ctl ansible_host=control-host  #here could be an IP instead of real host name
rmt ansible_host=remote-host
```

Work only on localhost
```
cat /etc/ansible/hosts

localhost ansible_connection=localhost
```


Aliases + Connection Types
```
cat /etc/ansible/hosts

#Aliases for servers

ctl ansible_host=control-host ansible_connection=ssh
rmt ansible_host=remote-host ansible_connection=ssh
```

Aliases + Connection Types + User To Connect
```
cat /etc/ansible/hosts

#Aliases for servers

ctl ansible_host=control-host ansible_connection=ssh ansible_user=root
rmt ansible_host=remote-host ansible_connection=ssh ansible_user=admin
```





### INVENTORY PARAMETERS

Another examples of Inventory parameters
```
ansible_host=control-host
ansible_connection - ssh/winrm/localhost
ansible_port - 22/5986
ansible_user - root/administrator
ansible_ssh_pass - password
```



## MODULES

[List](https://docs.ansible.com/ansible/latest/modules/list_of_all_modules.html) of modules.



## PLAYBOOKS

**Playbooks** - wet of instructions, where we define what we want Ansible to do

**Playbook** - a single YAML file; contain a set of *play*s.
    - **Play** - defines a set of tasks to be run on hosts; contain *task*s.
        - **Task** - a single action to be performed on the host; for example:
            - execute a command
            - run a script
            - install a package
            - shutdown/restart


##  ROLES

[Off Docs](https://docs.ansible.com/ansible/2.5/user_guide/playbooks_reuse_roles.html)

Example project structure:
```
site.yml
webservers.yml
fooservers.yml
roles/
   common/
     tasks/
     handlers/
     files/
     templates/
     vars/
     defaults/
     meta/
   webservers/
     tasks/
     defaults/
     meta/
```

Roles expect files to be in certain directory names. Roles must include at least one of these directories, however it is perfectly fine to exclude any which are not being used. When in use, each directory must contain a `main.yml` file, which contains the relevant content:

    - tasks - contains the main list of tasks to be executed by the role.
    - handlers - contains handlers, which may be used by this role or even anywhere outside this role.
    - defaults - default variables for the role (see Variables for more information).
    - vars - other variables for the role (see Variables for more information).
    - files - contains files which can be deployed via this role.
    - templates - contains templates which can be deployed via this role.
    - meta - defines some meta data for this role. See below for more details.




















