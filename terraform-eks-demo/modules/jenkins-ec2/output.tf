output "jenkins_public_ip" {
  description = "Public IP address of the Jenkins EC2 instance"
  value = aws_instance.jenkins.public_ip
}

output "jenkins_instance_id" {
  description = "ID of the Jenkins EC2 instance"
  value = aws_instance.jenkins.id
}

output "jenkins_security_group_id" {
  description = "Security Group ID attached to the Jenkins EC2 instance"
  value = aws_security_group.jenkins_sg.id
}

output "jenkins_ami_id" {
  description = "AMI ID used by the Jenkins EC2 instance"
  value = data.aws_ami.amazon_linux_2.id
}

output "jenkins_url" {
  description = "Public URL to access Jenkins Web UI"
  value       = format("http://%s:8080", aws_instance.jenkins.public_ip)
}