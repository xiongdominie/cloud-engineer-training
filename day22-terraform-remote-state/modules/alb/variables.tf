variable "name_prefix" {
  description = "Prefix used for ALB-related resource names"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "Public subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs to attach to the ALB"
  type        = list(string)
}

variable "target_group_port" {
  description = "Port the target group forwards traffic to"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/"
}

variable "health_check_matcher" {
  description = "Expected HTTP code for health check success"
  type        = string
  default     = "200"
}

variable "listener_port" {
  description = "Port the ALB listener will listen on"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol the ALB listener will use"
  type        = string
  default     = "HTTP"
}

variable "access_logs_bucket" {
  description = "S3 bucket name for ALB access logs"
  type        = string
}