# WHAT

Necessary configured Ansible servers are already up and running (see `00_initial_servers` dir).

Make sure they are configured for Ansible.

## STEPS

Login to the **Control Server** as a `vagrant` user.

Make any random dir.
```
mkdir -p ~/ansible/ping
```

Make an **Inventory File** with random name
```
cd ~/ansible/ping
vi inventory.file

remote ansible_host=remote-host
```

Ping **Remote Host** via Ansible
```
ansible remote -m ping -i inventory.file

    remote | SUCCESS => {
        "changed": false, 
        "ping": "pong"
    }
```



