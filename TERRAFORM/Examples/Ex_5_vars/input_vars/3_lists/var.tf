
##################################################################
## The file (with random name which ends with `.tf`) to define variables
##################################################################

variable "region" {}    # Variable can be defined here. 
                        # If not (like here), will be used default or one defined via -var-file (`.tfvars`, for example).



# Just some test vars
  
  # implicitly by using brackets [...]
variable "list_implic" { default = [] }

  # explicitly
variable "list_explic" { type = "list" }