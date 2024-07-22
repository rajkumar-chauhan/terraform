

resource "aws_security_group" "redis_security_group" {
  name        = "redis-security-group"
  description = "Security group for Redis instance"
  vpc_id      = "aws_vpc.ot_microservices_dev.id"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_security_group.id]
  }

  ingress {
    description = "Allow Redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    security_groups = [aws_security_group.attendance_security_group.id]
  }
   ingress {
    description = "Allow Redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    security_groups = [aws_security_group.salary_security_group.id]
  }
   ingress {
    description = "Allow Redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    security_groups = [aws_security_group.employee_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "redis-security-group"
  }
}

