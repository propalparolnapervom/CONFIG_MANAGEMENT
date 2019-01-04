
#############################################################################
## The resource block defines a resource that exists within the infrastructure. 
## A resource might be a physical component such as an EC2 instance, 
## or it can be a logical resource such as a Heroku application.
#############################################################################


resource "aws_instance"  "mod1_inst_by_tf" {    
  ami           = "ami-c86c3f23"
  instance_type = "t2.micro"

}