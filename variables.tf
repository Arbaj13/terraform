variable "AWS_REGION" {
  default = "us-east-1"

}
variable "vpcCIDR" {
    default = "172.21.0.0/16"
  
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
    default ="172.21.5.0/24"
  
}
variable "prisub3" {
    default = "172.21.6.0/24"
  
}


