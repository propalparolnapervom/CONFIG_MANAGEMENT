
## WHAT
Implement Terraform code, which would deploy an EC2 instance, running within ASG with ELB in front of it. This instance, through ELB, should share port 22 (SSH port) to outside Internet. Think about security of your solution.


## STEPS OF IMPLEMENTATION

1. Verify that Terraform is installed on your server (local PC):
```
terraform
```

[Install](https://www.terraform.io/intro/getting-started/install.html) it, if needed.

2. Verify that Git is installed on your server (local PC):
```
git --version
```

[Install](https://git-scm.com/downloads) it, if needed.

3. Make sure you have prepared [AWS account](https://console.aws.amazon.com/iam/home?#/users) with necessary permissions and ability to have programmatic credentials (not static ones).

4. Clone Git repo to any random location `<path_to_clone>` (if it wasn't done yet):
```
cd <path_to_clone>
git clone github.com:propalparolnapervom/CONFIG_MANAGEMENT.git
```

5. Edit `vars.tf` file to make its variables up-to-date, having following facts about already pre-defined AWS env:
  - AWS account with appropriate permissions is created;
  - Necessary VPC is created;
  - Necessary Role (IAM) is created;
  - Necessary Security_Group (EC2) is created;
  - Necessary Key_pair is created
```
vi <path_to_clone>/TERRAFORM/Examples/Ex_1/src/vars.tf
```

5. Start the process of EC2 creation in ASG with ELB:
```
cd <path_to_clone>/TERRAFORM/Examples/Ex_1/src
terraform init
terraform plan
terraform apply
```

6. Check your AWS env.

7. Destroy just created AWS env, if needed
```
cd <path_to_clone>/TERRAFORM/Examples/Ex_1/src
terraform destroy
```

























































