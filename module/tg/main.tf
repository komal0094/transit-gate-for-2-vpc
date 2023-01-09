resource "aws_ec2_transit_gateway" "tg" {
  description = "transit-gateway"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tg-1" {
  subnet_ids         = [var.sub-1-id]
  transit_gateway_id = aws_ec2_transit_gateway.tg.id
  vpc_id             = var.vpc-01-id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tg-2" {
  subnet_ids         = [var.sub-2-id]
  transit_gateway_id = aws_ec2_transit_gateway.tg.id
  vpc_id             = var.vpc-02-id
}