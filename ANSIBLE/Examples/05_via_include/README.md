# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

One big playbook can be separated on smaller files/pieces via `include` statement.

## STEPS

```
ansible-playbook main.yml -i inventory.txt
```