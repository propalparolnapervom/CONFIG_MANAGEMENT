#############################################################################
## The resource block defines a resource that exists within the infrastructure. 
## A resource might be a physical component such as an EC2 instance, 
## or it can be a logical resource such as a Heroku application.
#############################################################################


resource "aws_instance"  "inst_by_tf" {    
  ami           = "${var.ami_to_module}"
  instance_type = "t2.micro"

}