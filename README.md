
# Terraform-AWS-AppRunner

The Terraform repo contains the following:

- Terraform scripts: These scripts are written in the HashiCorp Configuration Language (HCL) and define the infrastructure that will be created in AWS. The scripts can create an ECR repository, App Runner service, and IAM roles and policies.
- React App directory: This directory contains a React application that can be deployed to App Runner.
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

To run this project, you will need to add the following environment variables of AWS account to your terraform.tfvars file

`access_key` 

`secret_key`

You need to change the below configuration in Terraform.tf files.


  backend "s3" {

    bucket = "terrafrom-workdir" -> S3 Bucket Name
    dynamodb_table = "terraform" -> DynamoDB Table Name

  }



## Pre Requisite

You need to install and configure Docker, Terraform and AWS Cli in your local machine.

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

