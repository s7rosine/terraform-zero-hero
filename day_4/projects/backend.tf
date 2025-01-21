terraform {
  backend "s3" {
    bucket         = "s7rosine-bucket"
    key            = "s7rosine-bucket/key/terraform.tfstate"  # Customize the path as needed
    region         = "us-east-1"  # Replace with your desired region
    dynamodb_table = "tf-locks"  # DynamoDB table for state locking
    encrypt        = true  # Enable encryption for state file
  }
}