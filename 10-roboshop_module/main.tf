resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.vpc_tags,
    var.common_tags
  )
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.igw_tags,
    var.common_tags
  )
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block


  tags = merge(
    var.public_subnet_tags , 
    var.common_tags
  )
}

resource "aws_subnet" "private" {  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block

  tags = merge(
    var.private_subnet_tags , 
    var.common_tags
  )
}

resource "aws_subnet" "database" { 
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr_block

  tags = merge(
    var.database_subnet_tags , 
    var.common_tags
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.public_route_table_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    var.common_tags,
    var.public_route_table_tags
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

   tags = merge(
    var.common_tags,
    var.private_route_table_tags
  )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

   tags = merge(
    var.common_tags,
    var.database_route_table_tags
  )
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" { 
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  subnet_id      = aws_subnet.database.id
  route_table_id = aws_route_table.database.id
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description

  dynamic ingress {
    for_each = var.ingress
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
    }
  }
    
  dynamic egress {
   for_each = var.egress
    content {
    from_port        = egress.value.from_port
    to_port          = egress.value.to_port
    protocol         = egress.value.protocol
    cidr_blocks      = egress.value.cidr_blocks
    }
  }
  tags = var.sg_tags
}