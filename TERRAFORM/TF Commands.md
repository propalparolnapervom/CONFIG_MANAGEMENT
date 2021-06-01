
## INIT

Initialize the working dir
```
terraform init
```



## PLAN

### Generate a plane

```
terraform plan
```

The current state is refreshed and the configuration is consulted to generate an action plan. 

The plan includes all actions to be taken: which resources will be created, destroyed or modified. 

It can be inspected by operators to ensure it is exactly what is expected. 


### Generate a plane to the file

Generate an execution plan (without applying) and put it to the `plan.txt` file
```
terraform plan -out plan.txt
```



## APPLY

### Generate a plan, apply it

Generate a plan, pause for its approving, apply it
```
terraform apply
```



### Previosly generated plan

Apply generated plan (no pauses for approve asking)
```
terraform apply plan.txt
```


## SHOW

Inspect the current state
```
terraform show
```

## OUTPUT

View output variable that were previously defined, for already running infrastructure

```
terraform output instance_pub_ip
```



## GRAPH

```
terraform graph
```

The plan can be visualized to show dependent ordering. 

> NB: Once the plan is captured, the execution phase can be limited to only the actions in the plan. 


## STATE

### List

List resources, currently defined in the state file
```
# All
terraform state list

  # OR
  
# Specific
terraform state list [module.<MODULE_NAME>.]<RESOURCE_TYPE>.<RESOURCE_NAME>
```

### Show

Describe specific resource, currently defined in the state file
```
terraform state show aws_cloudwatch_log_group.log_grp_name

  # aws_cloudwatch_log_group.log_grp_name:
  resource "aws_cloudwatch_log_group" "log_grp_name" {
      arn               = "arn:aws:logs:<AWS_REGION>:<AWS_ACC_NUM>:log-group:/aws/lambda/mc_alert"
      id                = "/aws/lambda/mc_alert"
      name              = "/aws/lambda/mc_alert"
      retention_in_days = 0
      tags              = {}
      tags_all          = {}
  }
```

### Remove
Let TF forget about specific resource (without destroying of actual resource).
```
terraform state rm [module.<MODULE_NAME>.]<RESOURCE_TYPE>.<RESOURCE_NAME> -dry-run

  # OR
  
terraform state rm [module.<MODULE_NAME>.]<RESOURCE_TYPE>.<RESOURCE_NAME>
```

### Import

Let TF become aware about actually existing CloudWatch Log Group resource

> Appropriate resource `[module.<MODULE_NAME>.]<RESOURCE_TYPE>.<RESOURCE_NAME>`  should already be described in the TF code (not applied, but just described)

```
terraform import [module.<MODULE_NAME>.]<RESOURCE_TYPE>.<RESOURCE_NAME>  <ACTUAL_RESOURCE: name, for example>

  # OR
  
terraform import -var-file="vars/some_file.tfvars" [module.<MODULE_NAME>.]<RESOURCE_TYPE>.<RESOURCE_NAME>  <ACTUAL_RESOURCE: name, for example>
```




## DESTROY

Destroy ALL!!! infrastructure described by TF config file
```
terraform destroy
```
