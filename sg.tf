resource "aws_security_group" "My_VPC_Security_group" {
  name        = "My_VPC_Security_Group"
  description = "Allow http and SSH"
  vpc_id      = "${aws_vpc.t4-vpc.id}"


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