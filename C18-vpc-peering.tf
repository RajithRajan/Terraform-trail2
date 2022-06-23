################################################################################
# VPC peering
################################################################################

resource "aws_route" "peeraccess" {
  route_table_id            = module.vpc.default_route_table_id
  destination_cidr_block    = var.mongodb_atlas_vpc_cidr
  vpc_peering_connection_id = mongodbatlas_network_peering.aws-atlas.connection_id
  depends_on                = [aws_vpc_peering_connection_accepter.peer]
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = mongodbatlas_network_peering.aws-atlas.connection_id
  auto_accept               = true
}

resource "aws_security_group_rule" "private-sg-mongodb-rule" {
  type              = "egress"
  from_port         = 27015
  to_port           = 27017
  protocol          = "tcp"
  cidr_blocks       = [var.mongodb_atlas_vpc_cidr]
  security_group_id = module.private-sg.security_group_id
}