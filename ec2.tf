data "aws_ami_ids" "ubuntu" {
  owners = ["236233967963"]

  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami_ids.ubuntu.id
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
    Name = "HelloWorld"
  }
}
