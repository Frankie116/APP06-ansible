# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# variables used in this project
# ---------------------------------------------------------------------------------------------------



variable "my-region-name" {
  description           = "The AWS region things are created in"
  default               = "London"
}


# main.tf -------------------------------------------------------------
variable "my-aws-region" {
  description           = "The AWS region things are created in"
  default               = "eu-west-2"
}


# 1a-vpc.tf -------------------------------------------------------------
variable my-vpc-cidr-block {
  description           = "CIDR block for VPC"
  type                  = string
  default               = "10.0.0.0/16"
}

variable my-priv-subnets-per-vpc {
  description           = "Number of private subnets. Maximum of 16."
  type                  = number
  default               = 2
}

variable my-priv-subnet-cidr-blocks {
  description           = "Available cidr blocks for private subnets"
  type                  = list(string)
  default               = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24",
    "10.0.10.0/24",
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24",
    "10.0.14.0/24",
    "10.0.15.0/24",
    "10.0.16.0/24"
  ]
}

variable my-pub-subnets-per-vpc {
  description           = "Number of public subnets. Maximum of 16."
  type                  = number
  default               = 2
}

variable my-pub-subnet-cidr-blocks {
  description           = "Available cidr blocks for public subnets"
  type                  = list(string)
  default               = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
    "10.0.109.0/24",
    "10.0.110.0/24",
    "10.0.111.0/24",
    "10.0.112.0/24",
    "10.0.113.0/24",
    "10.0.114.0/24",
    "10.0.115.0/24",
    "10.0.116.0/24"
  ]
}

# 2a-ec2-ami.tf -------------------------------------------------------------
variable my-instances-per-subnet {
  description = "Number of EC2 instances in each private subnet"
  type = number
  default = 1
}

variable my-instance-type {
  description = "Type of EC2 instance to use."
  type        = string
  default     = "t2.micro"
}

variable my-master-name {
    default = "my-ansible-master"
}

variable my-server-name {
    default = "my-ansible-slave"
}

variable my-ami-master {
    default = "ami-048a0f9a1baf4cbf3"
}

variable my-ami-slave {
    default = "ami-0ba0395f0281ca12e"
}



# 02g-keypair.tf -------------------------------------------------------------
variable "my-private-key" {
    default = "my-priv-keyname"
}
variable "my-public-key" {
    default = "ssh-rsa REDACTED-AAAABBBBBBCCCCCC"
}

# various ----------------------------------------------------------------
variable my-project-name {
  description           = "Name of the project. Used in resource names and tags."
  type                  = string
  default               = "lab000"
}

variable my-environment {
  description           = "Value of the 'Environment' tag."
  type                  = string
  default               = "prod"
}


# 04b-sg-rules-server.tf -------------------------------------------------------------
variable "my-port-app1" {
  description           = "Application port exposed"
  default               = 80
}


# 05c-lb-tg ----------------------------------------------------------------
variable "my-hc-path" {
  default               = "/"
}

variable "my-hc-interval" {
  default               = "30"
}


# 06a-route53-zone.tf ------------------------------------------------------------------
variable "my-existing-r53-zone" {
    default             = "redacted.com"    # this variable should point to an exiting r53 hosted zone
}


# 06b-route53-record-lb.tf -------------------------------------------------------------
variable "my-lb-hosted-zone" {
    default             = "ZHREDACTEDK8"
} 


# 12a-route53ebs-snapshot.tf -----------------------------------------------------------
variable "my-snapshot-master" {
  type                  = string
  default               = "my-snap-ansible-master"
}

variable "my-snapshot-slave" {
  type                  = string
  default               = "my-snap-ansible-slave"
}

# variable "my-snapshot-name" {
#   type                  = list(string)
#   default               = [
#     "my-snap-ansible-master",
#     "my-snap-ansible-slave"
#   ]
# }