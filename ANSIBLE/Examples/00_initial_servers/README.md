# WHAT

> Make sure `Vagrant` is already installed on your PC

Prepare servers to be used as labs during Ansible examples.

# PREPARATION

Here and further: From you local PC as **Control Machine** ...

```
cd CONFIG_MANAGEMENT/ANSIBLE/Examples/00_initial_servers
```

# INSTALL NECESSARY SERVERS

Install following hosts to play with Ansible

**Control Host**

Make server up
```
cd remote1
vagrant up
```

Login to the server
```
vagrant ssh
```

**Remote Host**

Make server up
```
cd remote2
vagrant up
```

Login to the server
```
vagrant ssh
```


# CREATE A KEY PAIR FOR CREATED SERVERS

## GENERATE A NEW SSH KEY on CONTROL SERVER

[Official Docs](https://www.ssh.com/ssh/keygen/)

**ssh-keygen** is a tool for creating new authentication key pairs for SSH. Such key pairs are used for automating logins, single sign-on, and for authenticating hosts.


Generate a key pair.

As your user on the local PC (which is **Control Machine** in our case)
```
      #Optionally, choose algorithm to use or leave it default:
      #   ssh-keygen -t rsa -b 4096
      #   ssh-keygen -t dsa
      #   ssh-keygen -t ecdsa -b 521
      #   ssh-keygen -t ed25519

ssh-keygen

      Generating public/private rsa key pair.
      Enter file in which to save the key (/home/vagrant/.ssh/id_rsa):
      Enter passphrase (empty for no passphrase):
      Enter same passphrase again:
      Your identification has been saved in /home/vagrant/.ssh/id_rsa.
      Your public key has been saved in /home/vagrant/.ssh/id_rsa.pub.
      The key fingerprint is:
      ...
```

## COPYING THE PUBLIC KEY TO THE REMOTE SERVER

Copy **public** (**!!!**) key from **Control Machine** to each **Remote Machine** 

(**each** *server*/*user* combination)

As your user on the local PC (which is **Control Machine** in our case)
```
      #File ~remote_user/.ssh/authorized_keys will be updated on the remote side by default
      
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.50.10
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.50.20
```

## VERIFICATION

### ADD FINGERPRINT

As your user on the local PC (which is **Control Machine** in our case)
```
ssh 'vagrant@192.168.50.10'
ssh 'vagrant@192.168.50.20'
```

In this case you manually added necessary fingerpring to known hosts list.

Now you can try to ping resources via Ansible.


### PING VIA ANSIBLE

Ping **Remote Host** via Ansible
```
ansible all -m ping -i ping/inventory.txt

      rmt2 | SUCCESS => {
      "changed": false,
      "ping": "pong"
      }
      rmt1 | SUCCESS => {
      "changed": false,
      "ping": "pong"
      }
```