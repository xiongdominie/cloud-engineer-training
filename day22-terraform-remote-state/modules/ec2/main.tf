resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
set -xe
yum install -y httpd
systemctl enable httpd
systemctl start httpd
sleep 10
echo "Hello from $(hostname)" > /var/www/html/index.html
chmod 644 /var/www/html/index.html
EOF

  tags = {
    Name = var.instance_name
  }
}