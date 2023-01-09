env = "vpc-wp"
env2 = "vpc-mysql"
cidr_block ="10.0.0.0/16"
cidr_block2 = "192.1.0.0/16"
#  cidr-1 = "10.0.0.0/16"
#  cidr-2 = "192.1.0.0/16"
pub-snet-detail = {
pub-sub-1 = {
          availability_zone = "us-east-1a"
        cidr_block = "10.0.0.0/18"
      }
      
}
pub-snet-detail2 = {
pub-sub-2 = {
          availability_zone = "us-east-1b"
        cidr_block = "192.1.0.0/18"
      }
      
}

//ec2 variable
ami-1 = "ami-052efd3df9dad4825"
instance_type1 = "t2.micro"
key1 = "key001"

sg_details = {
    "wp-sg" = {
        name = "wp-sg"
        description = "test"
        

        ingress_rules = [
            {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                security_groups = null
                self = null
            },
            {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                security_groups = null
                self = null
            },
             {
                from_port = 443
                to_port = 443
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                security_groups = null
                self = null
            },
          
        ]

  egress = {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    }}
    sg_details2 = {
    "mysql-sg" = {
        name = "mysql-sg"
        description = "test"
        
        ingress_rules = [
            {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                security_groups = null
                self = null
            },
            {
                from_port = 3306
                to_port = 3306
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                security_groups = null
                self = null
            },
          
        ]

  egress = {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    }
    }
   
   
   //tg
  
   