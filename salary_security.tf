

resource "aws_security_group" "salary_security_group" {
  name        = "salary-security-group"
  description = "Security group for salary instance"
  vpc_id      = "aws_vpc.ot_microservices_dev.id"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_security_group.id]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080    
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "salary-security-group"
  }
}
