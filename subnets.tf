resource "aws_subnet" "web-sub1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public-project-sub-terr"
  }
}

resource "aws_subnet" "web-sub2" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "public-project-sub-terr"
  }
}







resource "aws_subnet" "app-sub1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "privat-project-sub-terr"
  }
}
resource "aws_subnet" "app-sub2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "privat-project-sub-terr"
  }
}




resource "aws_subnet" "db-sub1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "privat-project-sub-terr-db"
  }
}
resource "aws_subnet" "db-sub2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "privat-project-sub-terr-db"
  }
}
