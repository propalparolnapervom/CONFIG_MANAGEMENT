# TERRAFORM

[Official Docs](https://www.terraform.io/docs/)

[Official Get Started](https://learn.hashicorp.com/terraform/#getting-started)

[Udemy Course](https://www.udemy.com/learn-devops-infrastructure-automation-with-terraform/)




## OVERALL


Terraform uses text files to describe infrastructure and to set variables. 

These text files are called **Terraform configurations** and end in:

  - `.tf` in case of Terraform format (which is more human-readable, supports comments, and is the generally recommended format for most Terraform files)
  - `.tf.json` in case of JSON (is meant for machines to create, modify, and update, but can also be done by Terraform operators if you prefer)

Configuration files describe to Terraform the components needed to run a single application or your entire datacenter. 

Terraform generates an execution plan describing what it will do to reach the desired state, and then executes it to build the described infrastructure. 

As the configuration changes, Terraform is able to determine what changed and create incremental execution plans which can be applied.

When invoking any command that loads the Terraform configuration, Terraform loads all configuration files within the directory specified in alphabetical order.

The files loaded must end in either `.tf` or `.tf.json` to specify the format that is in use. Otherwise, the files are ignored. Multiple file formats can be present in the same directory.

Terraform loads all configuration files within a directory and appends them together. Terraform also has a concept of overrides, a way to create files that are loaded last and merged into your configuration, rather than appended.



## SYNTAX



### TERRAFORM Syntax

Terraform syntax is
```
# An AMI
variable "ami" {
  description = "the AMI to use"
}

/* A multi
   line comment. */
resource "aws_instance" "web" {
  ami               = "${var.ami}"
  count             = 2
  source_dest_check = false

  connection {
    user = "root"
  }
}
```




### JSON Syntax

Example of JSON syntax:
```
{
  "variable": {
    "ami": {
      "description": "the AMI to use"
    }
  },

  "resource": {
    "aws_instance": {
      "web": {
        "ami": "${var.ami}",
        "count": 2,
        "source_dest_check": false,

        "connection": {
          "user": "root"
        }
      }
    }
  }
}
```


## OVERRIDES

Terraform loads all configuration files within a directory and appends them together. Terraform also has a concept of overrides, a way to create files that are loaded last and merged into your configuration, rather than appended.

### Example

If you have a Terraform configuration `example.tf` with the contents:
```
resource "aws_instance" "web" {
  ami = "ami-408c7f28"
}
```

And you created a file `override.tf` with the contents:
```
resource "aws_instance" "web" {
  ami = "foo"
}
```

Then the AMI for the one resource will be replaced with "foo". Note that the override syntax can be Terraform syntax or JSON. You can mix and match syntaxes without issue.


## STRUCTURE

The `provider` block is used to configure the named provider, in our case "aws". A provider is responsible for creating and managing resources. Multiple provider blocks can exist if a Terraform configuration is composed of multiple providers, which is a common situation.

The `resource` block defines a resource that exists within the infrastructure. A resource might be a physical component such as an EC2 instance, or it can be a logical resource such as a Heroku application.

### Resource

[Docs](https://www.terraform.io/docs/configuration/resources.html)

The most important thing you'll configure with Terraform are resources. **Resources** are a component of your infrastructure

  - low level component:
    - physical server
    - virtual machine
    - or container
    
  - higher level component
    - email provider
    - DNS record
    - database provider

### Example

A resource configuration looks like the following:
```
resource "aws_instance" "web" {
  ami           = "ami-408c7f28"
  instance_type = "t1.micro"
}
```

Whole list of [Providers](https://www.terraform.io/docs/providers/index.html) (`aws_instance` in example above).

Specifically, it contains[AWS Provider](https://www.terraform.io/docs/providers/aws/index.html)




















































