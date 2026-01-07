variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for ALB"
}

variable "instance_id" {
  type        = string
  description = "EC2 instance ID to attach to target group"
}