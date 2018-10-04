# TFENV ALL


## OVERALL

[tftool](https://github.com/Zordrak/tfenv) is a tool which is Terraform version manager.


## INSTALLATION

Log in on laptop as your user


Check out tfenv to any random place <TFENV_TEMP>
```
export TFENV_TEMP=~/init_install/.tfenv
mkdir -p $TFENV_TEMP
cd $TFENV_TEMP ; pwd
git clone https://github.com/kamatama41/tfenv.git $TFENV_TEMP
```

Add <TFENV_TEMP>/bin to your $PATH any way you like

```
echo 'export PATH=~/init_install/.tfenv/bin:$PATH' >> ~/.bash_profile
```



## USAGE


Get list of Terraform versions

```
tfenv list-remote
```



Install Terraform latest version

> NOTE: Terraform will be intalled on `<tfenv_install_dir>/bin` dir

```
tfenv install latest
```




Install Terraform with 0.11.8 version
```
tfenv install 0.11.8
```

View installed Terraform versions
```
tfenv list
```

Use specific Terraform version
```
tfenv use 0.7.0
tfenv use latest
```

Uninstall specific Terraform version
```
tfenv uninstall 0.7.0
tfenv uninstall latest
```





## Usage (ORIGINAL AUTHOR'S NOTES)


### tfenv install [version]
Install a specific version of Terraform. Available options for version:
- `i.j.k` exact version to install
- `latest` is a syntax to install latest version
- `latest:<regex>` is a syntax to install latest version matching regex (used by grep -e)
- `min-required` is a syntax to recursively scan your Terraform files to detect which version is minimally required. See [required_version](https://www.terraform.io/docs/configuration/terraform.html) docs. Also [see min-required](#min-required) section below.

```sh
$ tfenv install 0.7.0
$ tfenv install latest
$ tfenv install latest:^0.8
$ tfenv install min-required
$ tfenv install
```

If shasum is present in the path, tfenv will verify the download against Hashicorp's published sha256 hash. If [keybase](https://keybase.io/) is available in the path it will also verify the signature for those published hashes using hashicorp's published public key.

#### .terraform-version
If you use [.terraform-version](#terraform-version), `tfenv install` (no argument) will install the version written in it.

#### min-required

Please note that we don't do semantic version range parsing but use first ever found version as the candidate for minimally required one. It is up to the user to keep the definition reasonable. I.e.
```
// this will detect 0.12.3
terraform {
  required_version  = "<0.12.3, >= 0.10.0"
}
```

```
// this will detect 0.10.0
terraform {
  required_version  = ">= 0.10.0, <0.12.3"
}
```


### Specify architecture

Architecture other than the default amd64 can be specified with the `TFENV_ARCH` environment variable

```sh
TFENV_ARCH=arm tfenv install 0.7.9
```

### tfenv use &lt;version>
Switch a version to use

`latest` is a syntax to use the latest installed version

`latest:<regex>` is a syntax to use latest installed version matching regex (used by grep -e)

`min-required` will switch to the version minimally required by your terraform sources (see above `tfenv install`)

```sh
$ tfenv use min-required
$ tfenv use 0.7.0
$ tfenv use latest
$ tfenv use latest:^0.8
```

### tfenv uninstall &lt;version>
Uninstall a specific version of Terraform
`latest` is a syntax to uninstall latest version
`latest:<regex>` is a syntax to uninstall latest version matching regex (used by grep -e)
```sh
$ tfenv uninstall 0.7.0
$ tfenv uninstall latest
$ tfenv uninstall latest:^0.8
```

### tfenv list
List installed versions
```sh
% tfenv list
* 0.10.7 (set by /opt/tfenv/version)
  0.9.0-beta2
  0.8.8
  0.8.4
  0.7.0
  0.7.0-rc4
  0.6.16
  0.6.2
  0.6.1
```

### tfenv list-remote
List installable versions
```sh
% tfenv list-remote
0.9.0-beta2
0.9.0-beta1
0.8.8
0.8.7
0.8.6
0.8.5
0.8.4
0.8.3
0.8.2
0.8.1
0.8.0
0.8.0-rc3
0.8.0-rc2
0.8.0-rc1
0.8.0-beta2
0.8.0-beta1
0.7.13
0.7.12
...
```

## .terraform-version
If you put `.terraform-version` file on your project root, or in your home directory, tfenv detects it and use the version written in it. If the version is `latest` or `latest:<regex>`, the latest matching version currently installed will be selected.

```sh
$ cat .terraform-version
0.6.16

$ terraform --version
Terraform v0.6.16

Your version of Terraform is out of date! The latest version
is 0.7.3. You can update by downloading from www.terraform.io

$ echo 0.7.3 > .terraform-version

$ terraform --version
Terraform v0.7.3

$ echo latest:^0.8 > .terraform-version

$ terraform --version
Terraform v0.8.8
```

## Upgrading
```sh
$ git --git-dir=~/.tfenv/.git pull
```

## Uninstalling
```sh
$ rm -rf /some/path/to/tfenv
```




















