output "instance_ami_ubuntu" {
  value = aws_instance.ubuntu.ami
}

output "instance_arn_ubuntu" {
  value = aws_instance.ubuntu.arn
}

output "instance_ami_windows" {
  value = aws_instance.windows.ami
}

output "instance_arn_windows" {
  value = aws_instance.windows.arn
}