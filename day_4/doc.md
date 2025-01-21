WHAT IS A S3BACKEND
The main purpose of using an S3 backend is to:

Centralize and share the state file across different team members or environments.
Enable state locking with DynamoDB to prevent concurrent modifications.
Securely store the state file, often with encryption, to prevent data loss or corruption.
In short, an S3 backend helps with collaboration, reliability, and security of the Terraform state file.