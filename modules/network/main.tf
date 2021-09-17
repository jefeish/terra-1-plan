# #############################################################################
# Create a VPC for the Stack
# #############################################################################
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.stack_name}-${var.stack_id}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.stack_name}-igw-${var.stack_id}"
  }
}

# #############################################################################
# Create a stack of Private and Public Subnets
# #############################################################################
resource "aws_subnet" "private" {
  count             = length(var.subnet_layers)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_layers[count.index]["private_cidr"]
  availability_zone = var.subnet_layers[count.index]["az"]
  tags = {
    Name = "${var.stack_name}_subnet_private_${var.subnet_layers[count.index]["az"]}-${var.stack_id}"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.subnet_layers)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_layers[count.index]["public_cidr"]
  availability_zone       = var.subnet_layers[count.index]["az"]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.stack_name}_subnet_public_${var.subnet_layers[count.index]["az"]}-${var.stack_id}"
  }
}

# #############################################################################
# Create Elastic IPs for the NAT Gateways 
# #############################################################################
resource "aws_eip" "nat" {
  count = length(var.subnet_layers)
  vpc   = true
  tags = {
    Name = "${var.stack_name}_nat_eip_${var.subnet_layers[count.index]["az"]}-${var.stack_id}"
  }
}

# #############################################################################
# Create the NAT Gateways (one in each Public Subnet)
# #############################################################################
resource "aws_nat_gateway" "gw" {
  count         = length(var.subnet_layers)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "${var.stack_name}_nat_gw_${var.subnet_layers[count.index]["az"]}-${var.stack_id}"
  }
    
  depends_on = [
    aws_eip.nat,
  ]
}

# #############################################################################
# Create custom Route Tables, for each the Private Subnet (associate it)
# #############################################################################
resource "aws_route_table" "nat" {
  count  = length(var.subnet_layers)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw[count.index].id
  }

  tags = {
    Name = "${var.stack_name}_nat_route_${var.subnet_layers[count.index]["az"]}-${var.stack_id}"
  }
}

# #############################################################################
# Associate the Route Tables with the Private Subnets
# #############################################################################
resource "aws_route_table_association" "nat" {
  count          = length(var.subnet_layers)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.nat[count.index].id
}
