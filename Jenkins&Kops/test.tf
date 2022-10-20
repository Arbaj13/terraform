resource "aws_instance" "jenkins" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.medium"
  key_name      = "awsoct"
  user_data     = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install openjdk-11-jdk -y
                sudo apt install maven -y
                curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
                /usr/share/keyrings/jenkins-keyring.asc > /dev/null
                echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
                https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                /etc/apt/sources.list.d/jenkins.list > /dev/null
                sudo apt-get update
                sudo apt-get install jenkins -y
                ###
                EOF
  tags = {
    Name = "Jenkins Server"

  }
  vpc_security_group_ids = ["sg-081c6225252d4728d"]

}
resource "aws_instance" "sonarqube" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = "awsoct"
  vpc_security_group_ids = ["sg-076688bb2766bfacc"]
  user_data              = file("sonar.sh")
  tags = {
    Name = "SonarQube Server"

  }
}

resource "aws_instance" "kops" {
  ami                  = lookup(var.AMIS, var.AWS_REGION)
  instance_type        = "t2.micro"
  key_name             = "awsoct"
  iam_instance_profile = "vpcandec2"
  user_data            = <<-EOF
        #!/bin/bash
        sudo apt update 
        sudo apt install awscli -y
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        sudo chmod +x ./kubectl
        sudo mv kubectl /usr/local/bin/
        curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
        sudo chmod +x kops-linux-amd64
        sudo mv kops-linux-amd64 /usr/local/bin/kops
        sudo kops create cluster --name=kp.arbaj13.shop   --state=s3://arbajkopsstate   --zones=us-east-1a,us-east-1b   --node-count=2 --node-size=t2.micro --master-size=t2.medium --dns-zone=kp.arbaj13.shop
        sudo kops update cluster --name=kp.arbaj13.shop --state=s3://arbajkopsstate --yes --admin
        EOF

  tags = {
    Name = "Kops Server"

  }
}