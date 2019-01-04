
## WHAT

[Docs](https://www.terraform.io/docs/providers/terraform/d/remote_state.html)

Create via Terraform:

    - config_1:
        - 1 provider (AWS);
        - 1 resource (EC2 instance) with:
            - output variable that shows specified input variables during `apply` step
        - let Terraform keep its state files in the remote backend (s3)

    - config_2:
        - 1 provider (AWS);
        - 1 resource (EC2 instance) with:
        - let Terraform keep its state files in the remote backend (s3)
        - use/show data, stored on the remote backend of `config_1`





