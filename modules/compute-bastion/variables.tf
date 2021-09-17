variable "region" {
  description = "AWS region for template and ENI"
  type        = string
  default     = ""
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  description = "subnet ids to put the ec2 instances in"
  type        = list(any)
  default     = []
}

variable "bastion_ami" {
  description = "Amazon Linux 2"
  type        = string
  default     = "ami-0c2d06d50ce30b442"
}

variable "key_name" {
  description = "Keypair name"
  type        = string
  default     = ""
}

variable "pub_key" {
  description = "Public key for importing"
  type        = string
  default     = ""
}

variable "stack_name" {
  description = "Name prefix for the infrastructure stack"
  type        = string
  default     = "test"
}

variable "stack_id" {
  description = "postfix for the infrastructure stack"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Bastion instance type"
  type        = string
  default     = "t2.micro"
}

variable "cidr_list" {
  type = list(object({
    name     = string
    port     = number
    cidr     = string
    protocol = string
  }))
  default = [
    {
      name     = "SSH access"
      port     = 22
      cidr     = "0.0.0.0/0"
      protocol = "TCP"
    }
  ]
}
