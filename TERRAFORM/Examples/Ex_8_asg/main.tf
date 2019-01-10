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


#############################################################################
## The resource block defines a resource that exists within the infrastructure. 
## A resource might be a physical component such as an EC2 instance, 
## or it can be a logical resource such as a Heroku application.
#############################################################################



resource "aws_launch_configuration" "tf" {
  name_prefix          = "xbs-lc-by-tf-"
  image_id             = "ami-c86c3f23"
  instance_type        = "t2.micro"

}

resource "aws_autoscaling_group" "tf_asg" {
  name_prefix               = "xbs-asg-by-tf-"
  min_size                  = "2"
  max_size                  = "2"
  launch_configuration      = "${aws_launch_configuration.tf.id}"
  health_check_type         = "EC2"
  health_check_grace_period = 300
  termination_policies      = ["OldestLaunchConfiguration", "OldestInstance"]
  vpc_zone_identifier       = ["subnet-095da6e17b8a374ee"]
  
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

resource "aws_autoscaling_policy" "tf_cpu70" {
  name                      = "xbs-by-tf-cpu70"
  #adjustment_type           = "ChangeInCapacity"
  #scaling_adjustment        = 1                         # is only supported for policy type SimpleScaling
  policy_type               = "TargetTrackingScaling"
#   estimated_instance_warmup = 300
  autoscaling_group_name    = "${aws_autoscaling_group.tf_asg.name}"

   target_tracking_configuration {
     predefined_metric_specification {
       predefined_metric_type = "ASGAverageCPUUtilization"
     }

     target_value     = 70.0
     disable_scale_in = false
   }
}