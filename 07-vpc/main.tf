resource "aws_vpc" "roboshop" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "roboshop"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.roboshop.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.roboshop.id

  tags = {
    Name = "private"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.roboshop.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

