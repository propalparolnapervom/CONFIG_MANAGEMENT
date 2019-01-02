
##################################################################
## The file (with random name which ends with `.tf`) to define variables
##################################################################

variable "region" {}    # Variable can be defined here. 
                        # If not (like here), will be used default or one defined via -var-file (`.tfvars`, for example).



# So in the future it will choose the AMI depending on `region` var
  
variable "var_as_map" {
  type = "map"
  default = {
    "eu-central-1" = "ami-c86c3f23"
    "us-west-2" = "ami-4b32be2b"
  }
}