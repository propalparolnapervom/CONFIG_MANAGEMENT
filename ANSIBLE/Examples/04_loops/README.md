# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

Loops example: use loop to exclude repetitive tasks.

## STEPS

```
ansible-playbook loops.yml -i inventory.txt
```