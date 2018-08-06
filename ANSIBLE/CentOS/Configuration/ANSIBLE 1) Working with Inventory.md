# ANSIBLE WORKING WITH INVENTORY

[Docs](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html)


## OVERALL

Ansible works against multiple systems in your infrastructure at the same time. It does this by selecting portions of systems listed in Ansible’s inventory, which defaults to being saved in the location `/etc/ansible/hosts`. You can specify a different inventory file using the `-i <path>` option on the command line.



## HOSTS AND GROUPS

**Inventory formats**

Example of `/etc/ansible/hosts` is an INI-like (one of Ansible’s defaults)
```
mail.example.com

[webservers]
foo.example.com
bar.example.com

[dbservers]
one.example.com
two.example.com
three.example.com
```

YAML version of the same file
```
all:
  hosts:
    mail.example.com:
  children:
    webservers:
      hosts:
        foo.example.com:
        bar.example.com:
    dbservers:
      hosts:
        one.example.com:
        two.example.com:
        three.example.com:
```

**Port**

If you have hosts that run on non-standard SSH ports you can put the port number
```
badwolf.example.com:5309
```


**Patterns**

If you are adding a lot of hosts following similar patterns, you can do this rather than listing each hostname
```
[webservers]
www[01:50].example.com

[databases]
db-[a:f].example.com
```

**Connection type & user**

Select the connection type and user on a per host basis
```
[targets]

localhost              ansible_connection=local
other1.example.com     ansible_connection=ssh        ansible_user=mpdehaan
other2.example.com     ansible_connection=ssh        ansible_user=mdehaan
```




























