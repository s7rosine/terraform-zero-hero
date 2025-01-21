resource "aws_instance" "s7rosine_ec2_instance" {
  ami             = "ami-0e2c8caa4b6378d8c"  # Replace with your specific AMI ID
  instance_type   = "t2.micro"
  key_name        = "terra-key"

  tags = {
    Name  = "day_4"

  }
}

# resource "aws_s3_bucket" "tf_state" {
#   bucket = "s7rosine-bucket"


#}

# resource "aws_dynamodb_table" "terraform_locks" {
#   name           = "tf-locks"
#   hash_key       = "LockID"
#   billing_mode   = "PAY_PER_REQUEST"  # On-demand mode (you can also use "PROVISIONED" if needed)
#   attribute {
#     name = "LockID"
#     type =   "S"  # String type
#   }

#   tags = {
#     Name = "Tf State Lock Table"
#   }
# }

