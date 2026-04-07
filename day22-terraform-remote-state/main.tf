module "ec2_instance" {
  source = "./modules/ec2"

  ami           = var.ami
  instance_type = var.instance_type
  instance_name = var.instance_name

  subnet_id          = aws_subnet.public_1.id
  security_group_ids = [aws_security_group.ec2_sg.id]
}

module "alb" {
  source = "./modules/alb"

  name_prefix = "myapp"

  vpc_id             = aws_vpc.main.id
  subnet_ids         = [aws_subnet.public_1.id, aws_subnet.public_2.id]
  security_group_ids = [aws_security_group.alb_sg.id]

  target_group_port     = 80
  target_group_protocol = "HTTP"
  health_check_path     = "/"
  health_check_matcher  = "200"

  access_logs_bucket = aws_s3_bucket.alb_logs.bucket

  depends_on = [aws_security_group.alb_sg]
}

resource "aws_lb_target_group_attachment" "ec2" {
  target_group_arn = module.alb.target_group_arn
  target_id        = module.ec2_instance.instance_id
  port             = 80
}


