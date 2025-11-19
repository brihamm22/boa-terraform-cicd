resource "aws_security_group" "brian-sec-grp" {
  name        = "brian_allow_rules"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.brian_existing_vpc.id

  tags = {
    Name = "brian_firewall_rules"
  }
}



# allow all outgoing ports for ipv4
 
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.brian-sec-grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
 
 # Allow 22,80 
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
