terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "project-gateway"
  }
}

resource "aws_route_table" "table" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "public-project-rt"
  }

}


resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.web-sub1.id
  route_table_id = aws_route_table.table.id
}
resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.web-sub2.id
  route_table_id = aws_route_table.table.id
}


resource "aws_eip" "lb" {
  instance = aws_instance.web01.id
  vpc      = true
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.web-sub1.id

  tags = {
    Name = "gw NAT"
  }


  depends_on = [aws_internet_gateway.gateway]
}
