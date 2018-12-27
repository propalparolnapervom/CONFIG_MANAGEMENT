
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



## GRAPH

```
terraform graph
```

The plan can be visualized to show dependent ordering. 

> NB: Once the plan is captured, the execution phase can be limited to only the actions in the plan. 




## DESTROY

Destroy infrastructure described by TF config file
```
terraform destroy
```
