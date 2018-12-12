# PLAYBOOK COMMANDS

## HELP

Get help
```
ansible-playbook --help
```

## RUN

Run playbook (with default Inventory file)
```
ansible-playbook simple_playbook.yml
```

Run playbook (with custom Inventory file)
```
ansible-playbook simple_playbook.yml -i inventory.txt
```