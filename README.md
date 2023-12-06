# DevOps-Engineer
Assignment
Designing and infrastructure deployment using Terraform on AWS, utilizing ECS for container orchestration. Additionally, creating API and integrating with deployed infrastructure.

Solution:

Tasks:

The steps to deploy the given infrastructure include the following steps involved from scratch.

    • Setting up AWS Account:
Logged in with my AWS account.    																						  

    • Configuring the AWS CLI.

Installed the AWS CLI with Sudo apt install awscli command.
Using the AWS Screen, navigate to the AWS IAM for creating the user group.		


User Configured with the AWS CLI.
Credentials:

Access key ID
Secret access key
AKIAX22HJMU4CAXV5VOX
f+2hn6eXGtTpDYSa1OKfUZLd2m1UTwRuOAshV8Ss





Creating Docker image to replace the image container in Terraform Configuration file.
Docker Image created:

Containerized Application:
Write the Code for Hello World.

	
Create the docker file.
Stored the Docker Image on Amazon ECR.
Commands Used:
docker build -t helloworld .
docker tag helloworld:latest public.ecr.aws/z0u2v6u2/helloworld:latest
docker push public.ecr.aws/z0u2v6u2/helloworld:latest

Terraform Setup:
• Install Terraform on your local machine.
• Create a new directory for your Terraform configuration.

Solution:
Installed Terraform with the following guidelines on the URL:
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
Creating Directory to store terraform configurations.
--> Commands for running Terraform
--Terraform init
-- Saved the main.tf file in the directory.

Use the terraform init first.
Then terraform build

Note: It is essential to configure the AWS CLI, and then call the essential Terraform commands:


ECS Cluster:
• Define Terraform configuration to create an ECS cluster.
Description Provided in the file.

• Use the latest Amazon ECS-optimized Amazon Machine Image (AMI).

ami-0416c18e75bd69567

Containerized Application:

• Dockerize a simple API application (e.g., a "Hello World" API).
docker tag hello-world-api:latest <account-id>.dkr.ecr.<region>.amazonaws.com/<repository-name>:latest
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/<repository-name>:latest

In Addition, the relevant commands configurations have been saved in folders.
