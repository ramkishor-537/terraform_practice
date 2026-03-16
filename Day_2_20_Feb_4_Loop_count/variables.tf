variable "instances" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

# replace with your zone_id and domain_name
variable "zone_id" {
    default = "Z091928332964FRU1ZYJR"
}

variable "domain_name" {
    default = "practicedevops.online"
}

variable "fruits" {
    type = list(string)
    default = ["apple", "banana", "apple", "orange"]
}

variable "fruits_set" {
    type = set(string)
    default = ["apple", "banana", "apple", "orange"]
}


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

# variable "ec2_tags" {
#   type = map
#   default = {
#     Name = "variables-demo"
#     Project = "roboshop"
#     Terraform = "true"
#     Environment = "dev"
#   }
# }

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