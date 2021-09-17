# ##############################################################################
# Create a 'Bastion' hosts environment using AWS Auto-Scaling-Group (ASG).
# ASG is not used for general instance scaling of any kind, 
# it is strictly used as Auto-Recovery. Min/Max instances is set to the same!
# The instance count should always be '1' ! Because the EIP pool-size is '1'.
# ##############################################################################
resource "aws_autoscaling_group" "bastion" {
  name                 = "${var.stack_name}-bastion-asg-${var.stack_id}"
  vpc_zone_identifier  = var.subnet_ids
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  launch_configuration = aws_launch_configuration.bastion.name

  tag {
    key                 = "Name"
    value               = "${var.stack_name}-bastion-instance-${var.stack_id}"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "bastion" {
  # Terraform can't change a launch config that has a 'name', use 'name_prefix'
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration#using-with-autoscaling-groups
  name_prefix     = "${var.stack_name}-lc-bastion-${var.stack_id}"
  image_id        = var.bastion_ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.bastion.id]
  key_name        = var.key_name

  lifecycle {
    create_before_destroy = true
  }
}
