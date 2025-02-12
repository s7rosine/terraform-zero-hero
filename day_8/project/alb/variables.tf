variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-04b4f1a9cf54c11d0"
}

variable "alb_sg_name" {
  description = "Security group name for the Application Load Balancer"
  type        = string
  default     = "alb-sg"
}

variable "ec2_sg_name" {
  description = "Security group name for the EC2 instances"
  type        = string
  default     = "ec2-sg"
}

variable "blue_script" {
  description = "User data script for blue application"
  type        = string
  default     = "blue-app.sh"
}

variable "yellow_script" {
  description = "User data script for yellow application"
  type        = string
  default     = "yellow-app.sh"
}
variable  "record_type" {
  type = string
  default = "CNAME"
}
variable  "record_ttl" {
  type = string
  default = "60"
}
variable "zone_id" {
  type = string
  default = "Z10133933QJB0LVB8X0ER"
}







