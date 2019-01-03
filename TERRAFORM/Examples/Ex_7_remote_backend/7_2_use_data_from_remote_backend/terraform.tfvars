##################################################################
## The file to assign values for already defined variables in `var.tf` file
## P.S. For all files which match `terraform.tfvars` or `*.auto.tfvars` 
## present in the current directory, Terraform automatically 
## loads them to populate variables, defined earlier
##################################################################

region = "eu-central-1"

list_implic = [ "impl_1", "impl_2" ]

list_explic = [ "expl_1", "expl_2" ]
