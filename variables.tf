variable "region" {
  type    = string
  default = "us-west-2"
}

variable "stack_name" {
  type    = string
  default = "terra-1-demo"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "key_name" {
  type    = string
  default = "automation-demo-key"
}

variable "pub_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCEO5b0JhZM0FlVKJQE8Kmv+z+GTs8gMCUqhHePvXUQMZU2/pmywCU2myUM3DCAeNMl4MrpIdniM+7Clr4E0sZvEYFXd6lIv7doBCDyhPqnUrIXPhzVt+gZx7xKRBaWW8J8wj8sPECfYbEDWqtKN6C4vFedvdh6Oj6rkeaEJlqCGVAGrulOtU8EflVjwePeRU8ZWWyBvWnOHaZehrZbO2t4QbuBaOn1Ix/HUbZmN3+6+faRatr+Jy5sfyQb+QkLMYFfl3DtAQyAmeDQmJV7LLAbVXsCdkp02q8EVwRWu+gUW8zHR/WWPF09HFR1fDYKn7kxPRc9tjzVPUNdflVabBaF"
}

variable "subnet_layers" {
  type = list(object({
    az           = string
    private_cidr = string
    public_cidr  = string
  }))
  default = [
    {
      az           = "us-west-2a"
      private_cidr = "10.0.32.0/19"
      public_cidr  = "10.0.64.0/19"
    },
    {
      az           = "us-west-2b"
      private_cidr = "10.0.96.0/19"
      public_cidr  = "10.0.128.0/19"
    },
    {
      az           = "us-west-2c"
      private_cidr = "10.0.160.0/19"
      public_cidr  = "10.0.192.0/19"
    }
  ]
}
