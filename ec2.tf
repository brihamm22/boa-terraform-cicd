resource "aws_instance" "example" {
  ami           = var.my-os-image
  instance_type = var.my-size

  tags = {
    Name = var.vm-name
  }
  key_name = var.private-key-name
  vpc_security_group_ids = [aws_security_group.brian-sec-grp.id]
}

resource "local_file" "ipadx" {
    content = aws_instance.example.public_ip
    filename = "${path.module}/myip.txt"
}