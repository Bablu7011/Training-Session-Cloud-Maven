# Terraform Variables, Locals, Backend, Outputs & Sensitive Variables Labs

This repository contains hands-on Terraform labs focused on learning:

* Variable declaration methods
* Different variable types
* Local values (`locals`)
* Combining locals with variables
* Remote backend configuration using AWS S3 + DynamoDB
* Terraform outputs
* Sensitive variables

These labs were performed using AWS resources and Terraform CLI.

---

# Prerequisites

Before starting these labs, make sure you have:

* AWS Account
* Terraform Installed
* AWS CLI Configured
* IAM User with required permissions
* Git Bash / Terminal

---

# Lab 1 — Try using every variable declaration method taught in Session 2

## Objective

Learn different ways to pass variables in Terraform and apply them across resources.

---

## Methods Covered

* Default Variables
* Manual Input Variables
* `.tfvars` File
* Command Line Variables
* Environment Variables

---

## 1. Using Default Variable Values

Terraform automatically uses the default values defined inside `variables.tf`.

### Image Reference

![Using Default Variables](./1_Using_Default_Variable.png)

---

## 2. Passing Variables Manually During Execution

Terraform asks the user to provide variable values interactively.

### Image References

![Manual Variable Input 1](./2.1_by_variable_manually.png)

![Manual Variable Input 2](./2.2_by_variable_manually.png)

### What Happened

* Terraform prompted for variable values.
* Values were entered manually from terminal.
* Resources were planned using those values.

---

## 3. Using terraform.tfvars File

Variable values were stored inside a `.tfvars` file and automatically loaded by Terraform.

### Image Reference

![Using tfvars File](./3.1_bytfvars_variable_given.png)

### Example

```hcl
vpc_name    = "bytfvars_my_vpc"
subnet_name = "bytfvar_public_subnet"
new_igw      = "bytfvar_igw"
az_name     = "ap-south-1a"
```

---

## 4. Passing Variables Through Command Line

Variables were passed directly using the `-var` flag.

### Command Used

```bash
terraform plan -var="vpc_name=var-vpc" -var="subnet_name=var-public-subnet" -var="new_igw=var-first-igw" -var="az_name=ap-south-1b"
```

### Image References

![CLI Variable Method 1](./4.1_by_passing_variable_in_command.png)

![CLI Variable Method 2](./4.2_by_passing_variable_in_command.png)

---

## 5. Using Environment Variables

Environment variables were exported using `TF_VAR_`.

### Commands Used

```bash
export TF_VAR_subnet_name="env_my_subnet"
export TF_VAR_new_igw="env_my-igw"
export TF_VAR_az_name="us-east-1b"
export TF_VAR_vpc_name="env_my_vpc"
```

### Image References

![Environment Variable Method 1](./5.1_using_env_variable.png)

![Environment Variable Method 2](./5.2_using_env_variable.png)

---

## 6. Using Custom Variable File with -var-file

Custom variable files were used during Terraform execution.

### Command Used

```bash
terraform plan -var-file=vars/dev.tfvars
```

### Image References

![Var File Method 1](./6.1_using_var-file_variable.png)

![Var File Method 2](./6.2_using_var-file_variable.png)

---

# Lab 2 — Deploy resources using Terraform with different variable types

## Objective

Use multiple Terraform variable types while deploying AWS infrastructure.

---

## Variable Types Used

* `string`
* `number`
* `bool`
* `list`

---

## Resources Created

* AWS VPC
* AWS EC2 Instances

---

## Example Variable Types

```hcl
variable "vpc_name" {
  type = string
  #default     = "my_vpc"
  description = "New Vpc name"
}

variable "instance_names" {
  type = list(string)

  #default = ["dev-server", "test-server", "prod-server"]
}

variable "instance_count" {
  type = number
  #default     = 1
  description = "number of EC2 instances to create"
  
}

variable "map_ip" {
  type        = bool
  #default     = true
  description = "map public ip on launch"
}

```

---

## What Happened

* Multiple EC2 instances were created using list variables.
* Boolean variable controlled public IP assignment.
* Number variable controlled instance count.
* String variable handled naming.

### Image References

![Different Variable Types 1](./7.1_Using_diffrent_variable.png)

![Different Variable Types 2](./7.2_Using_diffrent_variable.png)

![Different Variable Types 3](./7.3_Using_diffrent_variable.png)

![Different Variable Types 4](./7.4_Using_diffrent_variable.png)

---

# Lab 3 — Use a locals block in a standard way

## Objective

Learn how to use Terraform `locals` to reduce repeated code and simplify naming.

---

## Example Used

```hcl
locals {
  prefix = "myapp"
  env = "dev"
  project = "terraform-project"
}
```

Resources reused the local value for naming consistency.

### Example

```hcl
Name = "${local.prefix}-${local.env}-${local.project}-vpc-igw"
```

---

## Benefits of Locals

* Avoid repeated values
* Improve readability
* Easier maintenance
* Standard naming conventions

---

### Image Reference

![Local Block Example](./8_local_block_variable.png)

---

# Lab 4 — Combine locals and variables together

## Objective

Combine Terraform variables and local values to generate dynamic resource names.

---

## Example

```hcl
locals {
  project_name = "terraform-project"
  environment  = "dev"
}
```

```hcl
Name = "${var.app_name}-${local.environment}-${local.project_name}-vpc-igw"
```

---

## What Happened

* Variable input was combined with local values.
* Dynamic naming convention was implemented.
* Resources received standardized names automatically.

---

### Image References

![Locals and Variables Combined 1](./9.1_combine_local\&variable_example.png)

![Locals and Variables Combined 2](./9.2_combine_local\&variable_example.png)

---

# Lab 5 — Configure and test a remote backend

## Objective

Configure Terraform remote backend using:

* AWS S3 Bucket
* DynamoDB Table

This helps store Terraform state securely and enables state locking.

---

## Resources Created

* S3 Bucket
* DynamoDB Table

---

## Backend Configuration

```hcl
terraform {
  backend "s3" {
    bucket         = "first-my-s3-bucket70111"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "my-first-dynamo-table"
  }
}
```

---

## What Happened

* Terraform state file moved from local system to S3.
* DynamoDB handled state locking.
* Backend initialization completed successfully.
* State file verified in S3 bucket.
* LockID verified inside DynamoDB table.

---

### Image References

![Remote Backend Creation 1](./10.1_Remote_backend_creation.png)

![Remote Backend Creation 2](./10.2_Remote_backend_creation.png)

![Backend Setup and Resource Creation 1](./10.3_backend_Setup_&_resource_creation.png)

![Backend Setup and Resource Creation 2](./10.4_backend_Setup_&_resource_creation.png)

![Verify LockID Generation](./10.5_Verify_LockID_generation.png)

![Verify Remote State File](./10.6_Verify_backend_Statefile_on_remote.png)

---

# Lab 6 — Use outputs to retrieve resource data

## Objective

Use Terraform outputs to display important infrastructure details after deployment.

---

## Example Outputs

```hcl
output "aws_vpc_id" {
  value = aws_vpc.main.id
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
```

---

## What Happened

Terraform displayed:

* VPC ID
* Public IP
* Private IP
* VPC Name

after successful deployment.

---

### Image References

![Output Example 1](./11.1_using_Output_example.png)

![Output Example 2](./11.2_using_Output_example.png)

---

# Lab 7 — Experiment with sensitive variables

## Objective

Learn how Terraform masks sensitive values using:

```hcl
sensitive = true
```

---

## Example

```hcl
output "instance_public_ip" {
    value =aws_instance.web.public_ip
}

output "aws_vpc_id" {
    value =aws_vpc.main.id
    sensitive = true
}


output "aws_private_ip" {
    value = aws_instance.web.private_ip
    sensitive = true
}

output "aws_vpc_name" {
    value = aws_vpc.main.tags["Name"]
}


output "aws_instance_count" {
    value = length(aws_instance.web)
    sensitive = true
}

```

---

## What Happened

Terraform masked sensitive values during:

* Plan
* Apply
* Output display

Sensitive values appeared as:

```bash
<sensitive>
```

instead of revealing actual data.

---

## Benefits

* Prevent accidental secret exposure
* Improve security
* Hide sensitive infrastructure information

---

### Image References

![Sensitive Variable Example 1](./12.1_Using_sensitive_variable.png)

![Sensitive Variable Example 2](./12.2_Using_sensitive_variable.png)

---

