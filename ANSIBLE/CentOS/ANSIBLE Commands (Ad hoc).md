# ANSIBLE COMMANDS (Ad hoc)

[Ad-hoc Docs](https://docs.ansible.com/ansible/latest/user_guide/intro_adhoc.html#intro-adhoc)

An **ad-hoc command** is something that you might type in to do something really quick, but don’t want to save for later.

> Ansible (inventory, ssh keys, etc) is fully configured by now.


## OVERALL

**Check installed version**

```
ansible --version

      ansible 2.4.2.0
        config file = /etc/ansible/ansible.cfg
        configured module search path = [u'/home/vagrant/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
        ansible python module location = /usr/lib/python2.7/site-packages/ansible
        executable location = /usr/bin/ansible
        python version = 2.7.5 (default, Jul 13 2018, 13:06:57) [GCC 4.8.5 20150623 (Red Hat 4.8.5-28)]
```

**View help**

```
ansible --help
```


## SYNTAX

Syntax for Ansible ad-hoc commands is
```
ansible <hosts> [-m <module_name>] -a <"arguments"> -u <username> [--become]
```
  
   - **hosts**: It can be any entry in the inventory file. For specifying all hosts in inventory, use all or '*'. Wild card patterns are also accepted.

   - **module_name**: It's an optional parameter. There are hundreds of modules available in Ansible. By default it is command. For example *shell, copy, yum, apt, file*.

   - **arguments**: We should pass values that are required by the module. It may change according to the module used.

   - **username**: It specifies the user account in which Ansible can execute commands. User account, SSH.

   - **become**: It's an optional parameter specified when we want to execute operations that need sudo privilege. By default become is false.




## TEST WITHOUT ACTUAL WORK

If you put a `-C` option, then Ansible will do a dry run of the command. It will not actually be applied on the nodes.
```
ansible -C remote-host -a "touch /tmp/finally" -u xburser

      remote-host | SKIPPED               <== if something is wrong, error message appears here instead
```


## EXAMPLES


### OVERALL
      
Run the command, on all servers in a group "remote", as your current user
```
ansible remote -a "touch /tmp/finally"
```

Run the command, on all servers in a group "remote", as "xburser" user (it has to be paired via ssh keys)
```
ansible remote -a "touch /tmp/finally" -u xburser
```


### MODULES


**command**

Used to execute command in bash and see the result
```
ansible remote-host -m command -a "pwd"

      remote-host | SUCCESS | rc=0 >>
      /home/vagrant                       <== output of the command
```


**shell**

Operations like *piping* and *redirects* will not work in command. In these situations, you have to use `shell` module.
```
ansible remote-host -m shell -a 'echo $LOGNAME'

      remote-host | SUCCESS | rc=0 >>
      vagrant                                <== output of the command
```

Previous example gives you output of the command on Control Machine. In following example file will be created on the Remote Machine
```
ansible remote-host -m shell -a 'echo $LOGNAME > /tmp/test'
```


**file**

[File Docs](https://docs.ansible.com/ansible/latest/modules/file_module.html)

Create file, set permission and ownership (`/tmp/test_file.txt`)
```
ansible remote-host -m file -a 'dest=/tmp/test_file.txt state=touch mode=777 owner=vagrant group=vagrant'
```

Create dir `/tmp/test_dir`, sets its permission and ownership
```
ansible remote-host -m file -a 'dest=/tmp/test_dir mode=700 state=directory owner=vagrant group=vagrant'
```





















