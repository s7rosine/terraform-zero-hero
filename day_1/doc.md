INFRASRTUCTURE AS A CODE
exercise: 
WAHT WERE USING BEFORE TERRAFORM? 
manual processes or script-based automation

HOW TERRAFORM COMMINICATE WITH AWS?:
install aws cli and have aws credentials access key and secret key

WHAT IS .TERRAFORM DIRECTORY?  
 It stores important files that Terraform uses to manage and provision infrastructure such as licence.txt
Stores the plugins (provider binaries) Terraform uses to interact with different cloud providers (e.g., AWS, Azure, GCP).

WHAT IS .TERRAFORM LOCK.HCL?
 Locks the exact versions of providers Terraform has downloaded during terraform init.
Ensures that collaborators using the same code always use the same provider versions.

WHAT IS .TERRAFORM.TFSTATE?
 It serves as the state file that keeps track of the actual infrastructure deployed by Terraform. it also make sure that the current state is equal to desired state
state file as a single source of truth for the current infrastructure.
tow people can not work at the same time on the statefile to avoid people making changes at the same time user A might provisionne an ec2 while user B is changing the security group of that ec2
A resource was deleted manually but still exists in the state file. in this case you can manually make change on the statefile
WHAT IS .TERRAFOM.TFSTATE.BACKUP?  
This backup allows you to restore your state to the last known good configuration if something goes wrong during your terraform apply operation.
It’s essentially a snapshot of your state file right before any changes are applied and only keeps the latest backup
any change done manually get overwitten
