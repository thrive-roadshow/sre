resource "aws_route_table" "private_thrive_roadshow" {
  vpc_id = aws_vpc.thrive_roadshow.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.thrive_roadshow.id
  }
  tags = {
    Name = "private_thrive_roadshow"
  }
}

resource "aws_route_table" "public_thrive_roadshow" {
  vpc_id = aws_vpc.thrive_roadshow.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.thrive_roadshow.id
  }
  tags = {
    Name = "public_thrive_roadshow"
  }
}

resource "aws_route_table_association" "private_ap_southeast_1a_thrive_roadshow" {
  subnet_id      = aws_subnet.private_ap_southeast_1a.id
  route_table_id = aws_route_table.private_thrive_roadshow.id
}

resource "aws_route_table_association" "private_ap_southeast_1b_thrive_roadshow" {
  subnet_id      = aws_subnet.private_ap_southeast_1b.id
  route_table_id = aws_route_table.private_thrive_roadshow.id
}

resource "aws_route_table_association" "public_ap_southeast_1a_thrive_roadshow" {
  subnet_id      = aws_subnet.public_ap_southeast_1a.id
  route_table_id = aws_route_table.public_thrive_roadshow.id
}

resource "aws_route_table_association" "public_ap_southeast_1b_thrive_roadshow" {
  subnet_id      = aws_subnet.public_ap_southeast_1b.id
  route_table_id = aws_route_table.public_thrive_roadshow.id
}



