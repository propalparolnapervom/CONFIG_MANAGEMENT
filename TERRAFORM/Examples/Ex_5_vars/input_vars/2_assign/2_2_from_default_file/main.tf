##################################################################
## The provider block is used to configure the named provider.
## A provider is responsible for creating and managing resources. 
## Multiple provider blocks can exist if a TF configuration 
## is composed of multiple providers, which is a common situation.
##################################################################

provider "aws" {
  # This uses more interpolations, this time prefixed with `var`.
  # This tells Terraform that you're accessing variables. 
  region     = "${var.region}"
}


#############################################################################
## The resource block defines a resource that exists within the infrastructure. 
## A resource might be a physical component such as an EC2 instance, 
## or it can be a logical resource such as a Heroku application.
#############################################################################


resource "aws_instance"  "inst_by_tf" {    
  ami           = "ami-c86c3f23"
  instance_type = "t2.micro"
}

