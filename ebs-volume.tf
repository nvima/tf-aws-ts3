resource "aws_ebs_volume" "instance" {
  availability_zone = "eu-central-1a"
  type              = "gp2"
  size              = 1
}

resource "aws_volume_attachment" "instance" {
  count                          = var.mode == "start" ? 1 : 0
  device_name                    = local.mount_device
  volume_id                      = aws_ebs_volume.instance.id
  stop_instance_before_detaching = true
  instance_id                    = aws_instance.instance[0].id
}
