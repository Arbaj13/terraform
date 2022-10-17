module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.16.1"
  azs = [ var.zone1,var.zone2,var.zone3 ]
  cidr = var.vpcCIDR
  name= var.vpc_name
  public_subnets = [ var.pubsub1,var.pubsub2,var.pubsub3 ]
  private_subnets = [ var.prisub1,var.prisub2,var.prisub3 ]
  enable_nat_gateway=true
  single_nat_gateway=true
  enable_dns_hostnames=true
  enable_dns_support =true
    tags={
      terraform = "true"
      Environment= "prod"
  }
  vpc_tags={
      Name= var.vpc_name
  }
}

