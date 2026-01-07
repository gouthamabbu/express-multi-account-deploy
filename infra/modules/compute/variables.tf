variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnet_id" {
  type        = string
  description = "Private subnet ID for EC2"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "allowed_sg_id" {
  type        = string
  description = "Security group allowed to access EC2 (ALB SG)"
}