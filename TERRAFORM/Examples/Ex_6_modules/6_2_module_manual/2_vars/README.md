
## WHAT

[Docs](https://learn.hashicorp.com/terraform/getting-started/variables#lists)

Create via Terraform:

    - 1 provider (AWS);
    - 1 resource (EC2 instance) with:
        - output variable that shows specified input variables during `apply` step
    - place it to the modules;


## STEPS

Make sure TF config file contains up-to-date info
```
cd root_module
cat main.tf
```

Initialize the working dir
```
terraform init
```

Generate an execution plan (without applying) and put it to the `plan.txt` file
```
terraform plan -out plan.txt
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
terraform destroy
```

## VISUALISATION

Modules:

![Modules](https://github.com/propalparolnapervom/OVERALL/blob/master/Pictures/tf_modules.png "Modules")





