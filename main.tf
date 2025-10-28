provider "aws" {
  region = "eu-north-1"
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "monitoring-server"]
}

resource "aws_instance" "one" {
  count                  = length(var.instance_names)
  ami                    = "ami-0866a3c8686eaeeba"  # ✅ Ubuntu Server 22.04 LTS (HVM), SSD Volume Type, eu-north-1
  instance_type          = "t3.micro"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-07497a48ddb5a2d1f"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
