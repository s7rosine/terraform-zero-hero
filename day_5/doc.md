# Terraform Workspaces Interview Questions

This document contains interview questions related to Terraform workspaces, ranging from beginner to more advanced levels.

## Beginner Level

1.  *What is a Terraform workspace?*
    *   (Answer: A workspace is a way to manage multiple instances of the same Terraform configuration.)

2.  *Why would you use Terraform workspaces?*
    *   (Answer: To manage different environments (e.g., development, staging, production) with the same code.)

3.  *What is the name of the default workspace?*
    *   (Answer: The default workspace is named "default".)

4.  *How do you create a new workspace?*
    *   (Answer: Using the command terraform workspace new <workspace_name>)

5.  *How do you switch between workspaces?*
    *   (Answer: Using the command terraform workspace select <workspace_name>)

## Intermediate Level

1.  *How do workspaces help in avoiding configuration duplication?*
    *   (Answer: You use the same Terraform code and then manage different state files and variables per environment)

2.  *How can you customize resources based on the current workspace?*
    *   (Answer: You can use the terraform.workspace variable inside your Terraform configuration.)

3.  *How do variables interact with workspaces?*
    *   (Answer: Variables are typically defined in terraform.tfvars files and you can use different variable files for different workspaces.)

4.  *Explain a scenario where using workspaces is beneficial.*
    *   (Answer: A typical scenario is managing distinct environments, for example, development, staging, and production.)

5.  **What happens if you terraform apply without selecting a specific workspace?**
    *   (Answer: The changes are applied to the current selected workspace)

## Advanced Level

1.  *How does remote state management relate to Terraform workspaces?*
    *   (Answer: Remote backends can manage state for each workspace separately in the same project.)

2.  *How can you automate actions based on the current workspace?*
    *   (Answer: You can use conditional logic in your Terraform configurations with the terraform.workspace variable and external scripts to do so.)

3.  *How would you implement a CI/CD pipeline that utilizes Terraform workspaces?*
    *   (Answer: Using the CI/CD pipeline to automatically switch to different workspaces based on branch name, and terraform apply the changes.)

4.  *What are the advantages and disadvantages of using workspaces compared to other options like separate Terraform projects?*
    *   (Answer: Workspaces are easier to maintain and reduce duplication, but can lead to more complex code if not managed correctly. Separate projects offer better isolation, but with more duplication.)

5.  *Can you explain how to handle sensitive data differently in each workspace?*
     *   (Answer: Use variables files that are encrypted and managed by vault, using terraform apply -var-file="secret.tfvars" to encrypt the sensitive variables in each workspaces)