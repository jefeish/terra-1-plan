# ##############################################################################
# Create a Security Group (+ Rules)  
# ##############################################################################
resource "aws_security_group" "bastion" {
  name_prefix = var.stack_name
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.stack_name}-bastion-sg-${var.stack_id}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "bastion_in" {
  count             = length(var.cidr_list)
  type              = "ingress"
  description       = var.cidr_list[count.index]["name"]
  from_port         = var.cidr_list[count.index]["port"]
  to_port           = var.cidr_list[count.index]["port"]
  protocol          = var.cidr_list[count.index]["protocol"]
  cidr_blocks       = [var.cidr_list[count.index]["cidr"]]
  security_group_id = aws_security_group.bastion.id
}

# ##############################################################################
# Install the Keypair for the EC2 instances
# ##############################################################################
# resource "aws_key_pair" "bastion" {
#   key_name   = var.key_name
#   public_key = var.pub_key
# }
