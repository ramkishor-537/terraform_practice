# precedence of a variable and we can pass variables like this:
# 1. default values inside variables.tf
# 2. terraform.tfvars
# 3. command line
# terraform plan -var="sg_name=allow-all-terraform-cmd"
# 4. env variables
# export TF_VAR_instance_type="t3.small"

# Highest Priority of variable in terraform is taken like this
# 1. command line -> see above for sample code
# 2. terraform.tfvars
# 3. env variables -> export TF_VAR_VAR_NAME="value"
#    here TF_VAR is mandatory after that you have give variable name
# 4. default values



# flow of execution for below code
# first before executing aws_instance code terraform will create SG and get id of SG 
# then after that create aws instance and attach SG through id

resource "aws_instance" "example" {
  ami           = var.amiid
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_tls.id] # .id means output we are getting from aws security group

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name # this is for AWS account
  description = var.sg_description

  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}