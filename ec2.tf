####################################################
# Create the Linux EC2 instance with a website
####################################################
resource "aws_instance" "health-ai-web" {
  ami = "ami-0866a3c8686eaeeba"
  #   data.aws_ami.amazon-linux-1.id
  instance_type               = var.instance_type
  key_name                    = "health_approval"
  subnet_id                   = module.vpc_health_ai.public_subnets[0]
  vpc_security_group_ids      = [module.web_server_sg.security_group_id]
  iam_instance_profile        = aws_iam_instance_profile.ecsInstanceRoleProfile.name
  associate_public_ip_address = true
  disable_api_termination     = true
  user_data                   = <<-EOT
    #!/bin/bash
    apt-get install -y amazon-ssm-agent
    systemctl enable amazon-ssm-agent
    systemctl start amazon-ssm-agent
    EOT

  tags = merge(var.common_tags, {
    Name = "${var.env}-health-ai"
  })
}

resource "aws_eip" "health-ai" {
  instance = aws_instance.health-ai-web.id
  tags = {
    Name = "${var.env}-health-ai"
  }
}

