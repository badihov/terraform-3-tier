resource "aws_instance" "web01" {
  ami           = var.ami-var
  instance_type = var.instance_type-var
  subnet_id     = aws_subnet.web-sub1.id
  user_data     = file("httpd.sh")
  depends_on = [
    aws_internet_gateway.gateway
  ]
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "project-tomcat-terr-web"
  }
}




resource "aws_db_subnet_group" "grp" {
  name       = "main"
  subnet_ids = [aws_subnet.db-sub1.id, aws_subnet.db-sub2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "db" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.grp.id
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  multi_az               = true
  username               = "foo"
  password               = "foobarbaz"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db-sg.id]
}

