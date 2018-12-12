# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

Run the simplest playbook.



## RUN PLAYBOOK

```
cd 01_simple_playbook; ls -la ; pwd

    -rw-r--r--  1 sbur  staff  469 Dec 12 16:50 README.md
    -rw-r--r--  1 sbur  staff  123 Dec 12 16:50 inventory.txt
    -rw-r--r--  1 sbur  staff  294 Dec 12 15:44 simple_playbook.yml
    /Users/sbur/overall/git_area/CONFIG_MANAGEMENT/ANSIBLE/Examples/01_simple_playbook

ansible-playbook simple_playbook.yml -i inventory.txt
```



