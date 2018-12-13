# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

Use role instead of using `include` statements. Separate one big playbook via role.

## STEPS

```
ansible-playbook main_with_role.yml -i inventory.txt
```