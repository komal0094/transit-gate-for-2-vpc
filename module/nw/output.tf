output "pub-snet-id" {
    value = {for k, v in aws_subnet.pub-subnet: k => v.id}
  
}
output "vpc-id" {
    value = aws_vpc.my-vpc001.id
  
}