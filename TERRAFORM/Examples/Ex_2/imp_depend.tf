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


# Resource type, its prefix maps to the provider.
# In our case "aws_instance" automatically tells
# Terraform that it is managed 
# by the "aws" provider
resource "aws_instance"                   
                        # Resource name
                        "inst_by_tf" {    
  ami           = "ami-c86c3f23"
  instance_type = "t2.micro"
}


# Resource type, its prefix maps to the provider.
# In our case "aws_eip" automatically tells
# Terraform that it is managed 
# by the "aws" provider
resource "aws_eip"                              
                    # Resource name
                    "eip_by_ft" {            
  # id of EC2 instance to assign the IP to   
  instance = "${aws_instance.inst_by_tf.id}"    
}
