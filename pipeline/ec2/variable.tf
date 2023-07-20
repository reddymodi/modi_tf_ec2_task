variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_owners" {
  description = "list of ami owners"
  type        = list(string)
  default     = ["099720109477"]
}

variable "asg_min_size" {
  description = "The minimum size of Auto scaling group"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "the maximum size of Auto scaling group"
  type        = number
  default     = 3
}

variable "asg_desired_capacity" {
  description = "desired capicity of auto scaling group"
  type        = number
  default     = 1
}

variable "security_groups" {
  description = "list the security groups"
  type        = set(string)
  default     = ["sg-02d6acd0dc7850342", "sg-01f0befa6c9eeffcf"]
}

variable "load_balancer_name" {
  description = "name of the load balanceer"
  type        = string
  default     = "modi123"
}

variable "load_balancer_type" {
  description = "type of the load balancer"
  type        = string
  default     = "application"
}

variable "subnets" {
  description = "ID of the subnet where the EC2 instance will be deploye"
  type        = list(string)
  default     = ["subnet-0b697dbf1d9956bd4", "subnet-0263045bb428921be"]
}

variable "target_group_port" {
  description = "port for the taget group"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "protocol for the target group"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "ID of the vpc"
  type        = string
  default     = "vpc-0783b06692f125be3"
}

variable "listner_port" {
  description = "port for the load balancer listener"
  type        = number
  default     = 80
}

variable "listner_protocol" {
  description = "protocol for the load balancer listener"
  type        = string
  default     = "HTTP"
}
