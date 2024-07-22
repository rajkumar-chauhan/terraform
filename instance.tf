resource "aws_instance" "Redis_instance" {
  ami           = "ami-03a540375661e02b7"
  subnet_id = aws_subnet.database_subnet.id
  key_name = "."
  vpc_security_group_ids = [ aws_security_group.redis_security_group.id ]
  instance_type = "t2.micro"

  tags = {
    Name = "Redis_instance"
  }
}
