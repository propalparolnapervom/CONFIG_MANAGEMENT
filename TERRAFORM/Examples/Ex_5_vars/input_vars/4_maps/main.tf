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


# AMIs are specific to the region that is in use. 
# One option is to just ask the user to input the proper AMI for the region, but Terraform can do better than that with maps.

# Maps are a way to create variables that are lookup tables.

# So it will choose the AMI depending on `region` var
resource "aws_instance" "example" {
  ami           = "${lookup(var.var_as_map, var.region)}"
  instance_type = "t2.micro"
}

