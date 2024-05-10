resource "aws_internet_gateway" "thrive_roadshow" {
  vpc_id = aws_vpc.thrive_roadshow.id

  tags = {
    Name = "thrive_roadshow"
  }
}
