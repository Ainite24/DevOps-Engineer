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
      -- AKIAX22HJMU4CAXV5VOX
      -- f+2hn6eXGtTpDYSa1OKfUZLd2m1UTwRuOAshV8Ss
`




Creating Docker image to replace the image container in Terraform Configuration file.

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



Deploying a Terraform infrastructure involves several steps to initialize the configuration, plan changes, and apply those changes to create or modify resources in your cloud provider. Below are the basic steps to deploy a Terraform infrastructure:

    Install Terraform:
        Ensure Terraform is installed on your machine. You can download the latest version from the official Terraform website: Terraform Downloads.

    Create a Terraform Configuration:
        Write your infrastructure code in a Terraform configuration file (e.g., main.tf). Define providers, resources, and any necessary variables or outputs.

    Initialize the Configuration:
        Open a terminal and navigate to the directory containing your Terraform configuration file.
        Run the following command to initialize the configuration:

        bash:

    terraform init

    This command downloads the necessary provider plugins and sets up the Terraform working directory.

Plan Changes:

    After initialization, run the following command to preview the changes Terraform will make to your infrastructure:

    bash:

    terraform plan

    Review the output to ensure it matches your expectations. Terraform will display a summary of the actions it will take.

Apply Changes:

    If the plan looks correct, apply the changes to create or modify resources:

    bash:

    terraform apply

    Terraform will prompt for confirmation. Type "yes" to proceed.
    This command executes the planned changes and creates or updates resources.

Verification (Optional):

    After applying changes, verify that the infrastructure was created or modified as expected.
    Use the cloud provider's console, CLI, or other tools to inspect the deployed resources.

Destroy Resources (Optional):

    If you want to destroy the created resources, run the following command:

    bash:
    
    terraform destroy

    Confirm the destruction by typing "yes" when prompted.
    Be cautious with this step, especially in a production environment.

Clean Up (Optional):

    After destroying resources, you can clean up the Terraform working directory by running:

    bash

        terraform destroy -auto-approve

        This will remove any residual state and leave the directory in a clean state.

These steps provide a basic outline for deploying Terraform infrastructure. Customize the commands and configurations based on your specific needs. Always exercise caution, especially when applying changes to production environments.
