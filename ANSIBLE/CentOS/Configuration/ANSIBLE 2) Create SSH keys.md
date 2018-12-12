# CREATE A KEY PAIR

## SSH-KEYGEN - GENERATE A NEW SSH KEY on CONTROL SERVER

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
      SHA256:2p6k1fQavFsY+4Uckhe9rSu0DgBoFK61RGBzrhFmzX8 vagrant@control-host
      The key's randomart image is:
      +---[RSA 2048]----+
      |  B+=.           |
      | + Oo.       .   |
      |  . B..     . .  |
      |   B ...E  . . o |
      |  o .  .S = o . .|
      |       o = O.o . |
      |      . + B.=.o  |
      |       = . Bo. . |
      |      . o +oo..  |
      +----[SHA256]-----+
```

## COPYING THE PUBLIC KEY TO THE REMOTE SERVER

Copy **public** (**!!!**) key from Control Machine to each **Remote Machine** (**each** *server*/*user* combination )
```
      #File ~remote_user/.ssh/authorized_keys will be updated on the remote side by default
      
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@remote-host
```
