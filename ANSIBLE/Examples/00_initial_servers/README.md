# WHAT

> Make sure `Vagrant` is already installed on your PC

# INSTALL NECESSARY SERVERS

Install following hosts to play with Ansible

**Control Host**

Make server up
```
cd machine_1
vagrant up
```

Login to the server
```
vagrant ssh
```

**Remote Host**

Make server up
```
cd machine_2
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

As a `vagrant` user on the **Control Machine**
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

As `vagrant` user on **Control Machine**.
```
      #File ~remote_user/.ssh/authorized_keys will be updated on the remote side by default
      
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@remote-host
```

## VERIFICATION

As `vagrant` user on **Control Machine** - try to login to each **Remote Machine**
```
ssh 'vagrant@remote-host'
```

In this case you manually added necessary fingerpring to known hosts list.

Now you can try to ping resources via Ansible.

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