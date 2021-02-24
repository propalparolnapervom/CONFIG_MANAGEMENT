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


## INVENTORY FILE

If no other specified, Ansible expects Inventory file to be a default `/etc/ansible/hosts` one.

If you'd like to specify Inventory file on non-default path/name of the file - just use `-i` key:
```
ansible remote -m ping -i inventory.file
```

### Inverntory file to work with EC2

When EC2 started and available via appropriate Key Pair, Ansible could work with it with following Inventory file
```
webserver ansible_host=3.249.111.206 ansible_user=ubuntu ansible_ssh_private_key_file="/path/to/key_pair.pem"
```

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

[All modules list/description](https://docs.ansible.com/ansible/latest/modules/list_of_all_modules.html?highlight=copy%20module)

**command**

[Command Docs](https://docs.ansible.com/ansible/latest/modules/command_module.html?highlight=command)

Used to execute command in bash and see the result
```
ansible remote-host -m command -a "pwd"

      remote-host | SUCCESS | rc=0 >>
      /home/vagrant                       <== output of the command
```


**shell**

[Shell Docs](https://docs.ansible.com/ansible/latest/modules/shell_module.html#shell-module)

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

**copy**

[Copy Docs](https://docs.ansible.com/ansible/latest/modules/copy_module.html#copy-module)

Used for copying files "Control Machine -> Remote Machine"
```
ansible remote-host -m copy -a 'src=/tmp/is_on_orig_mach.txt dest=/tmp/was_on_orig_mach.txt'
```

**fetch**

[Fetch Docs](https://docs.ansible.com/ansible/latest/modules/fetch_module.html#fetch-module)

Used for copying files "Remote Machine -> Control Machine"
```
ansible remote-host -m fetch -a 'src=/tmp/was_on_orig_mach.txt dest=/tmp/again_on_orig_mach.txt'
```



















