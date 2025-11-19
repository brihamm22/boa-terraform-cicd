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

# Role
resource "aws_iam_role" "brian_role" {
  name = "brian_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2025-11-18"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

# Policy
resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
