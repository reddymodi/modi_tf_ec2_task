# modi_tf_ec2_task
in this scenario creat a ec2 servers with using terraform infrastructure. 
i am using aws provider and diffrent resources and varibles. 
'module "ec2-my" {
   source = "/home/ubuntu/terraform/ec2"
}'
my module name is 'ec2-my' and take the source create the infrastructure.
requid version of terraofrm and aws.
terraform = >= 1.2,
aws      = >= 5.8.0

