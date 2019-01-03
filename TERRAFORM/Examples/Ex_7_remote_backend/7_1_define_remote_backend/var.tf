
##################################################################
## The file (with random name which ends with `.tf`) to define variables
##################################################################

variable "region" {}    # Variable can be defined here. 
                        # If not (like here), will be used default or one defined via -var-file (`.tfvars`, for example).



# Just some test input vars
  
  # implicitly by using brackets [...]
variable "list_implic" { default = [] }

  # explicitly
variable "list_explic" { type = "list" }


# Specify output variables

output "implict_var" {          # The name of the variable must conform to Terraform variable naming conventions 
                                # if it is to be used as an input to other modules. 
  value = "${var.list_implic}"
}

output "explic_var" {           # The name of the variable must conform to Terraform variable naming conventions 
                                # if it is to be used as an input to other modules. 
  value = "${var.list_explic}"
}

output "instance_pub_ip" {      # The name of the variable must conform to Terraform variable naming conventions 
                                # if it is to be used as an input to other modules. 
  value = "${aws_instance.inst_by_tf.public_ip}"
}
