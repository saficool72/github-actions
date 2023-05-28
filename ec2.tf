resource "aws_vpc" "myvpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-myvpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-mysubnet"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0715c1897453cabd1"
  subnet_id     = aws_subnet.my_subnet.id
  instance_type = "t2.micro"
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              sed -i -e 's/80/8080/' /etc/apache2/ports.conf
              echo "Hello World" > /var/www/html/index.html
              systemctl restart apache2
              EOF


  tags = {
    Name = "HelloWorld-2"
  }
}
