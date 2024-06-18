resource "aws_instance" "thrive_roadshow-observability" {
  ami           = "ami-03caf91bb3d81b843"
  instance_type = "t2.large"

  subnet_id = aws_subnet.public_ap_southeast_1a.id
  # vpc_security_group_ids      = [aws_security_group.thrive_roadshow.id]
  associate_public_ip_address = true
  tags = {
    Name = "thrive_roadshow-observability"
  }

}
