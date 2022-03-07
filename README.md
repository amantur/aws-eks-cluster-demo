# aws-eks-cluster-demo

Terraform code to setup **AWS Elastic Kubernetes Service** cluster. Uses definitions from [github.com/amantur/terraform-modules](https://github.com/amantur/terraform-modules)

----------------------------------

## Prerequisits
1. An active Amazon Web Services (AWS) account
2. An IAM user with administrator access
3. AWS CLI configured with appropriate access id and key

> If you don't have account or IAM user then follow the steps [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-prereqs.html "Setup AWS & IAM Account") to create an account and a user first.*

To run change into **`src`** directory.

Initialize terraform:
```
terraform init
```

To plan the demo use **`demo.tfvars`** file to provide required values:
```
terraform plan --var-file deploy/demo.tfvars
```

To apply the changes:
```
terraform apply
```
