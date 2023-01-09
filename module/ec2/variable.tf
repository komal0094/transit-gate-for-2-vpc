variable "ec2-sub" {
   type = map(object({
    pub-snet = string
    hostname = string
   })) 
}

variable "ec2-sub2" {
   type = map(object({
    pub-snet2 = string
    hostname = string
   })) 
}
variable "ami" {
    
}
variable "insta-type" {
    }

variable "sg" {
  
}
variable "sg2" {
  
}

variable "key_name" {
 }
variable "environment" {
  
}
variable "iam-access" {
  
}
