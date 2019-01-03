##################################################################
## The file with variables defined
## (can be named anything, since Terraform 
## loads all files ending in `.tf` in a directory)
##################################################################

#variable "access_key" {}   #If not defined like here, will be asked during run. If not present, will be taken from `~/.aws/credentials`
#variable "secret_key" {}   #If not defined like here, will be asked during run. If not present, will be taken from `~/.aws/credentials`
variable "region" {
  default = "eu-central-1"         #If a default value is set, the variable is optional. Otherwise, the variable is required.
}