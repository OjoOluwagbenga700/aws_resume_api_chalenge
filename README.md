# Resume_API_Challenge
 Before we begin, ensure you have the following:
1.	AWS Account: An active AWS account with the necessary permissions.
2.	Terraform: Installed on your local machine.
3.	AWS CLI: Installed and configured on your local machine.

Step 1: Define Your JSON Resume Data
Create your resume in JSON format. You can use a json schema from the link below
https://jsonresume.org/schema

Step 2: Define Your Lambda function
We will be creating a python code that our lambda function will use to retrieve the resume data from DynamoDB

Step 3: Create Terraform Configuration
Create a new directory for your Terraform configuration files. Inside this directory, we will create a sub-directory for our modules. Each folder in the modules directory will contain the infrastructures required to be deployed for the service.

1.	Api Gateway module: This describes the detailed terraform configuration for our Api gateway. 

2.	DynamoDB Module: This module contains the terraform codes for deploying DynamoDB and also uploading the resume Json data on it.

3.	Iam_Role Module: This module contains the terraform codes that defines the necessary permissions for lambda function to access DynamoDB and CloudWatch.

4.	Lambda Module: This module defines the terraform codes for archiving the python code in a zip file and also create a lambda function from same.

Step 4: Test your codes locally
Run terraform Init to initialize the terraform plugins and providers

Run terraform validate to validate the terraform codes.

Run terraform plan to preview the infrastructures to be deployed. Also note that the Zip file for the lambda function will also be created in the project directory

Run terraform apply --auto-approve to deploy the infrastructure on AWS 

Copy the api_gateway_invoke_url as indicated in the output of above action  and run a test locally from VScode . Ensure you include /path_part of the api gateway. 

Run terraform destroy --auto-approve to destroy the infrastructure on AWS 

Step 4: Configure GitHub Actions
To automate the deployment process using GitHub Actions, create a .github/workflows directory in your project root directory and add a file named deploy.yml

Step 5: Configure GitHub Secrets
In your GitHub repository, navigate to Settings > Secrets and variables and add the  secrets and variables.

Whenever there is a push action on the main branch or a pull request to the main branch, the GitHub action is automatically triggered. See result of a push action to the main branch of the repository.


To verify, copy the api_gateway_invoke_url/data and run on your browser. ensure to add /data i.e my api gateway path_part.( you can have a different name)



