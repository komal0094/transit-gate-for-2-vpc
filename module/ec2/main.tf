resource "aws_instance" "wp-ec2" {
  for_each = var.ec2-sub
   ami           = var.ami
  instance_type = var.insta-type
  key_name = var.key_name
   subnet_id = each.value["pub-snet"]
   security_groups = [var.sg]
   iam_instance_profile = var.iam-access
   user_data = file("${path.module}/word.sh")
   
tags = {
    Name = "${var.environment}-ec2-${each.value["hostname"]}"
  }
    
}

resource "aws_instance" "mysql-ec2" {
  for_each = var.ec2-sub2
   ami           = var.ami
  instance_type = var.insta-type
  key_name = var.key_name
   subnet_id = each.value["pub-snet2"]
   security_groups = [var.sg2]
   user_data = file("${path.module}/mysql.sh") 
  
tags = {
    Name = "${var.environment}-ec2-${each.value["hostname"]}"
  }
    
}

