resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Allow web traffic and SSH"
  vpc_id      = aws_vpc.vpc1.id

  # Inbound rules (ingress)
  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this to your IP in production
  }

  ingress {
    description = "HTTPS from anywhere "
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from specific IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["66.189.104.66/32"]
  }
    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"# all protocol
    cidr_blocks = ["0.0.0.0/0"] # Example: Only allow from internal network
  }
 tags = {
    Name        = "example-sg"
    Environment = "dev"
    Terraform   = "true"
  }
depends_on = [ aws_vpc.vpc1 ]
 
}
  
