variable "AWS_REGION" {
  default = "us-east-1"

}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0149b2da6ceec4bb0"
  }
}

