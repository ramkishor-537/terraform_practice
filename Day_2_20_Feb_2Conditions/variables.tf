variable "environment" {
  default = "prod"
}

variable "amiid" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type = string 
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map
  default = {
    Name = "variables-demo"
    Project = "roboshop"
    Terraform = "true"
    Environment = "dev"
  }
}

variable "sg_name" {
  default = "allow-all-terraform-default"
  type = string
}

variable "sg_description" {
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "sg_from_port" {
  type = number
  default = 0
}

variable "sg_to_port" {
  type = number
  default = 0
}

variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map
  default = {
    Name = "allow-all-terraform"
    Project = "roboshop"
    Terraform = "true"
    Environment = "dev"
  }
}