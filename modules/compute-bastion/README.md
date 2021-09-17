# Module: ghes-bastion

## Description

## Notes

---
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_key_pair.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_configuration.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_security_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.bastion_in](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_ami"></a> [bastion\_ami](#input\_bastion\_ami) | AMI | `string` | `""` | no |
| <a name="input_cidr_list"></a> [cidr\_list](#input\_cidr\_list) | n/a | <pre>list(object({<br>    name     = string<br>    port     = number<br>    cidr     = string<br>    protocol = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr": "0.0.0.0/0",<br>    "name": "SSH access",<br>    "port": 22,<br>    "protocol": "TCP"<br>  }<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Bastion instance type | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Keypair name | `string` | `""` | no |
| <a name="input_pub_key"></a> [pub\_key](#input\_pub\_key) | Public key for importing | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region for template and ENI | `string` | `""` | no |
| <a name="input_stack_id"></a> [stack\_id](#input\_stack\_id) | postfix for the infrastructure stack | `string` | `""` | no |
| <a name="input_stack_name"></a> [stack\_name](#input\_stack\_name) | Name prefix for the infrastructure stack | `string` | `"test"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | subnet ids to put the ec2 instances in | `list` | `[]` | no |
| <a name="input_target_ids"></a> [target\_ids](#input\_target\_ids) | Instance ID | `list` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | default VPC | `string` | `""` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | String representing the AWS Route 53 zone name | `string` | `""` | no |

## Outputs

No outputs.
