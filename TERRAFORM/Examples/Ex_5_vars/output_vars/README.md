
[Output](https://learn.hashicorp.com/terraform/getting-started/outputs)

When building potentially complex infrastructure, Terraform stores hundreds or thousands of attribute values for all your resources. 

But as a user of Terraform, you may only be interested in a few values of importance, such as a load balancer IP, VPN address, etc.

**Outputs** are a way to tell Terraform what data is important. 

This data is outputted when `apply` is called, and can be queried using the `terraform output` command.