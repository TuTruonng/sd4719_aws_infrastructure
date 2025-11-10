#!/bin/bash
set -eux

# Update system
sudo yum update -y

# Install Java (required for Jenkins)
sudo amazon-linux-extras install java-openjdk17 -y || sudo yum install -y java-17-amazon-corretto-devel

# Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install -y jenkins

# Install Docker
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker

# Add users to Docker group
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins

# Enable Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Git, kubectl, AWS CLI v2
sudo yum install -y git unzip curl
curl -LO "https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

if ! command -v aws &> /dev/null; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm -rf aws awscliv2.zip
fi

# Restart services to apply all permissions
sudo systemctl restart docker
sudo systemctl restart jenkins