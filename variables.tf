variable "AWS_REGION" {
  default = "us-east-1"

}
variable AMIS {
  type = map
  default = {
    us-east-2  = "ami-07efac79022b86107"
    us-east-1  = "ami-08c40ec9ead489470"
    ap-south-1 = "ami-009110a2bf8d7dd0a"
  }
}
variable "username" {
    default = "ubuntu"
  
}
variable "db_name" {
  default = "accounts"

}
variable "db_user" {
  default = "admin"

}
variable "db_pass" {
  default = "admin123"

}
variable "rmquser" {
  default = "rabbit"
}
variable "rmqpass" {
  default = "A@r@n@779812"

}
variable "MYIP" {
  default = "0.0.0.0/0"

}
variable "vpcCIDR" {
  default = "172.21.0.0/16"

}
variable "instance_count" {
  default = "1"
  
}
variable "pubkey" {
  default = "vprofile.pub"

}
variable "private_key" {
    default = "vprofile"
  
}
variable "vpc_name" {
  default = "vprofile-VPC"

}
variable "zone1" {
  default = "us-east-1a"

}
variable "zone2" {
  default = "us-east-1b"

}
variable "zone3" {
  default = "us-east-1c"

}

variable "pubsub1" {
  default = "172.21.1.0/24"

}
variable "pubsub2" {
  default = "172.21.2.0/24"

}
variable "pubsub3" {
  default = "172.21.3.0/24"

}
variable "prisub1" {
  default = "172.21.4.0/24"

}
variable "prisub2" {
  default = "172.21.5.0/24"

}
variable "prisub3" {
  default = "172.21.6.0/24"

}


