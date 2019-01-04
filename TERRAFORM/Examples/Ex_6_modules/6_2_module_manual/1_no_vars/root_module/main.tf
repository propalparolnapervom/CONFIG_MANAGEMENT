
##################################################################
## The provider block is used to configure the named provider.
## A provider is responsible for creating and managing resources. 
## Multiple provider blocks can exist if a TF configuration 
## is composed of multiple providers, which is a common situation.
##################################################################

provider "aws" {
  # This uses more interpolations, this time prefixed with `var`.
  # This tells Terraform that you're accessing variables. 
  region     = "eu-central-1"
}

##################################################################
## List of modules that will be added to the root-level
##################################################################

module "mod_1" {
  source = "../add_module_1"
}


