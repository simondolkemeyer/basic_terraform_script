resource "aws_security_group" "My_VPC_Security_group" {
  name        = "My_VPC_Security_Group"
  description = "Allow http and SSH"
  vpc_id      = aws_vpc.My_VPC.id


 ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


 ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "mysql"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "My_VPC_Security_Group"
  }
}


resource "aws_security_group" "allow_db_access" {
  name        = "allow_db_access"
  vpc_id = aws_vpc.My_VPC.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.My_VPC_Security_group.id] 
  }

  tags = {
    Name = "allow_db_access"
  }
}