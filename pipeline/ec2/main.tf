
resource "aws_key_pair" "key" {
  key_name   = "my-key-pair"
  public_key = file("/root/my-key-pair.pub")
}

data "aws_ami" "modi_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


  owners = var.ami_owners

}

resource "aws_instance" "my-instance" {
  ami           = data.aws_ami.modi_ami.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key.key_name
  tags = {
    name = "modi_ec2"
  }
}

resource "aws_launch_configuration" "asg_launch" {
  name            = "launch_config"
  image_id        = data.aws_ami.modi_ami.id
  instance_type   = var.instance_type
  security_groups = var.security_groups
  key_name        = aws_key_pair.key.key_name

}

resource "aws_autoscaling_group" "modi_asg" {
  name                 = "example_asg"
  min_size             = var.asg_min_size
  max_size             = var.asg_max_size
  desired_capacity     = var.asg_desired_capacity
  launch_configuration = aws_launch_configuration.asg_launch.name
  vpc_zone_identifier  = ["subnet-0b697dbf1d9956bd4"]

}

resource "aws_lb" "load_balancer" {
  name               = var.load_balancer_name
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnets

}

resource "aws_lb_target_group" "target_group" {
  name     = "awstarget"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listner" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.listner_port
  protocol          = var.listner_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.my-instance.id
}

