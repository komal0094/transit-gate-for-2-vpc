data "aws_availability_zones" "available" {
  state = "available"
}

//vpc create
resource "aws_vpc" "my-vpc001" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.environment}-vpc"
    
  }
}

//subnet create
resource "aws_subnet" "pub-subnet" {
  for_each = var.pub-snets
  map_public_ip_on_launch = "true"
 availability_zone  = each.value["availability_zone"]
  cidr_block = each.value["cidr_block"]
  vpc_id     = aws_vpc.my-vpc001.id

  tags = {
    # Name = "${terraform.workspace}-pub-snets"
    Name = "${var.environment}-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc001.id
}

//route table
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.my-vpc001.id
route {
    cidr_block = var.rt-cidr
    transit_gateway_id = var.transit_gateway_id
}
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}
tags = {
    Name = "${var.environment}-pub-rt"
  }
 }

 resource "aws_route_table_association" "pub-ass" {
   for_each = aws_subnet.pub-subnet
   subnet_id      = each.value.id
   route_table_id = aws_route_table.pub-rt.id
 }
