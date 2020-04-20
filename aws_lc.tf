resource "aws_launch_configuration" "lc" {
  depends_on = ["aws_ami_from_instance.ami"]
  name = "Terraform_launch_configuration"
  image_id = aws_ami_from_instance.ami.id
  instance_type = var.i_type
  security_groups = ["sg-0fdc9c8c32c542bfd"]
  key_name = "custom-KP"
  user_data ="${file("ngx.sh")}"
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
      }
}
