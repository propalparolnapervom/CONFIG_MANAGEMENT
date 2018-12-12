# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

Make variables on the Play level.

## RUN

```
ansible-playbook vars-playbook.yml -i inventory.txt
```