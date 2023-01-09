output "tg2" {
  value = aws_ec2_transit_gateway_vpc_attachment.tg-2.id
}

output "tg1" {
  value = aws_ec2_transit_gateway_vpc_attachment.tg-1.id
}

output "tg" {
  value = aws_ec2_transit_gateway.tg.id
}