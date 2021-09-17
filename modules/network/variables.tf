variable "stack_name" {
  description = "Name prefix for the infrastructure stack"
  type        = string
  default     = "test"
}

variable "region" {
  description = "AWS region (us-east-1,us-west-1,etc.)"
  type        = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_layers" {
  description = "Layers of private/public subnet per Availibility Zone"
  type        = list(any)
}

variable "stack_id" {
  type    = string
  default = ""
}
