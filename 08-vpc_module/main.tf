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
  count      = length(var.public_subnet_cidr_block)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block[count.index]


  tags = merge(
    var.public_subnet_tags , 
    var.common_tags
  )
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnet_cidr_block)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block[count.index]

  tags = merge(
    var.private_subnet_tags , 
    var.common_tags
  )
}

resource "aws_subnet" "database" {
  count      = length(var.database_subnet_cidr_block) 
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr_block[count.index]

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
  count = length(var.public_subnet_cidr_block) 
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_block) 
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr_block) 
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}

