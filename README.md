
# Terraform-AWS-AppRunner

The Terraform repo contains the following:

- [Terraform scripts](https://github.com/jadonharsh109/Terraform-AWS-AppRunner/tree/fb4c3edcbf849c2be8f2e378484e9e96f3096e58/Terraform%20App%20Runner%20Env): These scripts are written in the HashiCorp Configuration Language (HCL) and define the infrastructure that will be created in AWS. The scripts can create an ECR repository, App Runner service, and IAM roles and policies.
- [React App directory](https://github.com/jadonharsh109/Terraform-AWS-AppRunner/tree/fb4c3edcbf849c2be8f2e378484e9e96f3096e58/movies-app): This directory contains a React application that can be deployed to App Runner.
The Terraform scripts can be used to create the following infrastructure in AWS:

- An ECR repository: This is a private Docker registry that can be used to store Docker images.
- An App Runner service: This is a managed service that can be used to deploy and run Docker containers.
- IAM roles and policies: These are used to control access to AWS resources.
The Terraform scripts can also be used to build and deploy Docker images to ECR and App Runner. To do this, you need to provide the following information to the Terraform scripts:

- The Docker image name
- The Dockerfile location
- The AWS region

Once you have provided this information, you can run the Terraform scripts to create the infrastructure and deploy the Docker image.

Here are some of the benefits of using Terraform to manage AWS infrastructure:

- Terraform is a declarative language, which means that you can describe the infrastructure you want to create in a way that is easy to understand.
- Terraform is a reusable tool, so you can use the same scripts to create infrastructure in different environments.
- Terraform is a powerful tool, so you can use it to create complex infrastructure.



## Environment Variables

To run this project, you will need to add the following environment variables of the AWS account to your [terraform.tfvars](https://github.com/jadonharsh109/Terraform-AWS-AppRunner/blob/fb4c3edcbf849c2be8f2e378484e9e96f3096e58/Terraform%20App%20Runner%20Env/terraform.tfvars) file

`access_key` 

`secret_key`

You need to change the below configuration in [Terraform.tf](https://github.com/jadonharsh109/Terraform-AWS-AppRunner/blob/a92b051cc0de508cba1c1a39fdfeed794b9c5c28/Terraform%20App%20Runner%20Env/Terraform.tf) files.


  backend "s3" {

    bucket = "terrafrom-workdir" -> S3 Bucket Name
    dynamodb_table = "terraform" -> DynamoDB Table Name

  }



## Pre Requisite

You need to install and configure [Docker](https://github.com/jadonharsh109/My-DevOps-Journey/blob/cf6b153e11b02e4b579f9f3764e976ca11badd05/DevOps%20CheatSheet/Vm's%20Provisioning%20Script/Installation%20-%20Docker.txt) , [Terraform](https://github.com/jadonharsh109/My-DevOps-Journey/blob/cf6b153e11b02e4b579f9f3764e976ca11badd05/DevOps%20CheatSheet/Vm's%20Provisioning%20Script/Installation%20-%20Terraform.txt) and AWS Cli in your local machine.

```bash
  aws configure
```
    
## Run Locally

Clone the project

```bash
  git clone https://github.com/jadonharsh109/Terraform-AWS-AppRunner.git
```

Go to the project directory

```bash
  cd Terraform-AWS-AppRunner/Terraform\ App\ Runner\ Env
```

Init Backend and Providers

```bash
  terraform init
```

Apply the terraform script

```bash
  terraform apply --auto-approve
```

## Tech Stack

**AWS:** ECR, App Runner, IAM Roles, IAM Policy, S3, Dynamo DB

**Others:** Terraform, Docker, Linux, ReactJS, Git 

