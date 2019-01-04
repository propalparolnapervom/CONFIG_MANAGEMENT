
##################################################################
## The file (with random name which ends with `.tf`) to define variables
##################################################################

variable "region" {}    # Variable can be defined here. 
                        # If not (like here), will be used default or one defined via -var-file (`.tfvars`, for example).



# Specify output variables 
#  (which is placed in the state file, so on the remote backend in this case)

output "conf2_inst_pub_ip" {      # The name of the variable must conform to Terraform variable naming conventions 
                                # if it is to be used as an input to other modules. 
  value = "${aws_instance.inst_by_tf.public_ip}"
}

output "conf1_inst_pub_ip_as_seen_from_conf2" {      # The name of the variable must conform to Terraform variable naming conventions 
                                # if it is to be used as an input to other modules. 
  value = "${data.terraform_remote_state.config_1_remote.conf1_inst_pub_ip}"
}
