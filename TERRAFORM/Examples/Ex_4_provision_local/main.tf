##################################################################
## The provider block is used to configure the named provider.
## A provider is responsible for creating and managing resources. 
## Multiple provider blocks can exist if a TF configuration 
## is composed of multiple providers, which is a common situation.
##################################################################

provider "aws" {                #In our case provider is "aws"
  #access_key = "acc_k"         #If not defined, will be taken from `~/.aws/credentials`
  #secret_key = "sec_k"         #If not defined, will be taken from `~/.aws/credentials`
  region     = "eu-central-1"
}


#############################################################################
## The resource block defines a resource that exists within the infrastructure. 
## A resource might be a physical component such as an EC2 instance, 
## or it can be a logical resource such as a Heroku application.
#############################################################################


resource "aws_instance"  "inst_by_tf" {    
  ami           = "ami-c86c3f23"
  instance_type = "t2.micro"
  
  # The `local-exec` provisioner executes a command locally on the machine running Terraform
  # (so on your PC)
  # This provisioner only (!!!) runs when a resource is **created** (not already running) (BY DEFAULT)
  provisioner "local-exec" {
    command = "echo This is public IP of created EC2: ${aws_instance.inst_by_tf.public_ip} > /tmp/ip_address.txt"
}
}

