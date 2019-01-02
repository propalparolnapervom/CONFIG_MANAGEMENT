
## WHAT

[Docs](https://www.terraform.io/docs/configuration/variables.html#variable-files)

Create via Terraform:
    - 1 provider (AWS);
    - 1 resource (EC2 instance) with:
        - variables, defined via `var.tf` file
        - variables, assigned in the non-default file `non-def-vars.tfvars` (For all files which match `terraform.tfvars` or `*.auto.tfvars` present in the current dir, Terraform automatically loads them to populate variables)


## STEPS

Make sure TF config file contains up-to-date info
```
cat main.tf
```

Initialize the working dir
```
terraform init
```

Generate an execution plan (without applying) and put it to the `plan.txt` file
```
terraform plan -out plan.txt -var-file non-def-vars.tfvars
```

Apply generated plan (no pauses for approve asking)
```
terraform apply plan.txt
```

Inspect the current state for created resource
```
terraform show

    aws_instance.inst_by_tf:
    id = i-0150a2f280c68ae70
    ami = ami-c86c3f23
    arn = arn:aws:ec2:eu-central-1:491792459462:instance/i-0150a2f280c68ae70
    associate_public_ip_address = true
    availability_zone = eu-central-1b
    ...
    private_ip = 172.31.41.185
    public_dns = ec2-3-121-195-51.eu-central-1.compute.amazonaws.com
    public_ip = 3.121.195.51
    ...
```


## CLEAN UP

Destroy infrastructure described by TF config file
```
terraform destroy -var-file non-def-vars.tfvars
```




