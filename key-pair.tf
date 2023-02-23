# resource "aws_key_pair" "public_key" {
#   count      = var.mode != "stop" ? 1 : 0
#   key_name   = "ts-key-pair"
#   public_key = file(~/.ssh/id_rsa.pub)
# }
