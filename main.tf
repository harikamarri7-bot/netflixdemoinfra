provider "aws" {
  region = "eu-north-1"
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "monitoring-server"]
}

resource "aws_instance" "one" {
  count                  = length(var.instance_names)
  ami                    = "ami-0a68bfeb2d7b29d39"  # ✅ Ubuntu Server 22.04 LTS (x86_64) for eu-north-1
  instance_type          = "t3.micro"               # ✅ Common and supported in eu-north-1
  key_name               = "jenkins"                # ensure this key pair exists in eu-north-1
  vpc_security_group_ids = ["sg-07497a48ddb5a2d1f"] # must belong to same region

  tags = {
    Name = var.instance_names[count.index]
  }
}
