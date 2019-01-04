
##################################################################
## The file (with random name which ends with `.tf`) to define variables
##################################################################

variable "region" {}    # Variable can be defined here. 
                        # If not (like here), will be used default or one defined via -var-file (`.tfvars`, for example).



# Specify output variables 
#  (will be available outside of `config_1`)
#  (which are placed in the state file, so on the remote backend in this case)

output "conf1_inst_pub_ip" {    # The name of the variable must conform to Terraform variable naming conventions 
                                # if it is to be used as an input to other modules. 
  value = "${aws_instance.inst_by_tf.public_ip}"
}
