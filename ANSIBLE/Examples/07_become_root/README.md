# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

Make some moves as a `root` user.

## STEPS

```
ansible-playbook as_root.yml -i inventory.txt
```