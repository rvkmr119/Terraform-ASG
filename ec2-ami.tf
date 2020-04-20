data "aws_availability_zones" "available" {
}

resource "aws_instance" "ec2" {
  ami = var.amitype
  key_name = "custom-KP"
  vpc_security_group_ids = ["sg-0fdc9c8c32c542bfd"]
  subnet_id = var.subs[0]
  associate_public_ip_address = true
  instance_type = var.i_type
  availability_zone = data.aws_availability_zones.available.names[0]
  user_data = "${file("ngx.sh")}"
  tags = {
      Name = "Nginx-server"
  }
}


resource "aws_ami_from_instance" "ami" {
  name = var.name
  depends_on = ["aws_instance.ec2"]
  source_instance_id = aws_instance.ec2.id
  snapshot_without_reboot = false
  tags = {
    name = var.name
  }
}
