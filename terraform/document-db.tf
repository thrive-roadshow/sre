resource "aws_db_subnet_group" "thrive_roadshow" {
  name        = "thrive-roadshow"
  description = "thrive-roadshow"
  subnet_ids  = [aws_subnet.private_ap_southeast_1a.id, aws_subnet.private_ap_southeast_1b.id]
}

resource "aws_docdb_cluster" "thrive_roadshow" {
  cluster_identifier   = "thrive-roadshow"
  engine               = "docdb"
  engine_version       = "5.0.0"
  master_username      = "admin"
  master_password      = "password"
  apply_immediately    = true
  db_subnet_group_name = aws_db_subnet_group.thrive_roadshow.name
  tags = {
    Name = "thrive-roadshow"
  }
  port                   = "27017"
  vpc_security_group_ids = [aws_security_group.thrive_roadshow.id]
}

resource "aws_docdb_cluster_instance" "thrive_roadshow" {
  count              = 2
  identifier         = "thrive-roadshow-${count.index}"
  cluster_identifier = aws_docdb_cluster.thrive_roadshow.id
  instance_class     = "db.t3.medium"
  apply_immediately  = true
  tags = {
    Name = "thrive-roadshow-${count.index}"
  }
}

