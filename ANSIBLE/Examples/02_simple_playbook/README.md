# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

Run the simplest playbook.

## PREPARATION

Login to the **Control Server** as a `vagrant` user.

Make any random dir.
```
mkdir -p ~/ansible/simple_playbook
```

Make an **Inventory File** with random name
```
cd ~/ansible/simple_playbook
vi inventory.file
```

## VIEW PLAYBOOK

```
cd ~/ansible/simple_playbook
vi simple_playbook.yml
```


## RUN PLAYBOOK

```
cd ~/ansible/simple_playbook ; ls -la ; pwd

    -rw-rw-r--. 1 vagrant vagrant  32 Dec 12 13:27 inventory.file
    -rw-rw-r--. 1 vagrant vagrant 195 Dec 12 13:28 simple_playbook.yml
    /home/vagrant/ansible/simple_playbook

ansible-playbook simple_playbook.yml -i inventory.file
```



