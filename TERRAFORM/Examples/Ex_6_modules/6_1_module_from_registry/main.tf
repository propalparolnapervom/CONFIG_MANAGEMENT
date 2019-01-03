
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

# Define module
module "1st_module_consul" {   # could be any random name

  # Example given on the Terraform Registry page for this module, telling Terraform to create and manage this module
  source = "hashicorp/consul/aws"       # the only mandatory argument for modules

  num_servers = "1"
}


# View module output
output "consul_server_asg_name" {
  value = "${module.1st_module_consul.asg_name_servers}"
}