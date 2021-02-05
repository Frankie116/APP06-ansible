# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates a new ec2 instance
# ---------------------------------------------------------------------------------------------------

# req:
# 1a-vpc.tf              - module.my-vpc.private_subnets
# 04a-sg-server.tf       - [aws_security_group.my-sg-server.id]
# variables.tf           - var.my-instances-per-subnet
# variables.tf           - var.my-ami
# variables.tf           - var.my-instance-type
# variables.tf           - var.my-private-key
# variables.tf           - var.my-server-name
# variables.tf           - var.my-project-name
# variables.tf           - var.my-environment


locals {
  master-count                = 1
  instance-count              = var.my-instances-per-subnet * length(module.my-vpc.private_subnets)
}

resource "aws_instance" "my-ansible-master" {
  count                       = local.master-count
  ami                         = var.my-ami-master
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.private_subnets[count.index % length(module.my-vpc.private_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-server.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = false
  tags                        = {
    Name                      = "${var.my-master-name}-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = var.my-environment
    Terraform                 = "true"
  }
}

resource "aws_instance" "my-server" {
  count                       = local.instance-count
  ami                         = var.my-ami-slave
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.private_subnets[count.index % length(module.my-vpc.private_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-server.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = false
  tags                        = {
    Name                      = "${var.my-server-name}-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = var.my-environment
    Terraform                 = "true"
  }
}