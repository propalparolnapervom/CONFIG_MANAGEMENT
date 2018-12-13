# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

Conditionals example: add line only if it's absent.

## STEPS

```
ansible-playbook conditional.yml -i inventory.txt
```


