output "ami_id" {
  value       = data.aws_ami.joindevops.id # fetch the ami id dynamically from aws
}

output "instance_info" {
    value = data.aws_instance.terraform_instance
}