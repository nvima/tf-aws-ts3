resource "aws_instance" "instance" {
  count         = var.mode == "start" ? 1 : 0
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  subnet_id     = aws_default_subnet.default.id
  user_data     = data.template_file.user_data.rendered
# key_name      = aws_key_pair.public_key[0].key_name

  security_groups = [
    aws_security_group.teamspeak_server_sg[0].id
  ]
}

data "template_file" "user_data" {
  template = file("cloudinit.yaml")
  vars = {
    mount_point  = local.mount_point
    mount_device = local.mount_device
    password     = var.password
  }
}
