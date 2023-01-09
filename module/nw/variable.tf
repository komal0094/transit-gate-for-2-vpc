variable "vpc_cidr" {
  }

  variable "environment" {
    
  }
  variable "pub-snets" {
    type = map(object({
  cidr_block = string
  availability_zone = string
    }))
}
variable "rt-cidr" {
  
}
variable "transit_gateway_id" {
  
}