resource "aws_eip" "thrive_roadshow" {
  vpc = true

  tags = {
    Name = "thrive_roadshow"
  }
}

resource "aws_nat_gateway" "thrive_roadshow" {
  allocation_id = aws_eip.thrive_roadshow.id
  subnet_id     = aws_subnet.public_ap_southeast_1a.id

  tags = {
    Name = "thrive_roadshow"
  }

  depends_on = [aws_internet_gateway.thrive_roadshow]
}
