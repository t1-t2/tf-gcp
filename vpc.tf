module "network" {
  source   = "./modules/network"
  vpc_name = "nandrusiak-vpc"

  public_subnet_name = "public-subnet"
  public_subnet_cidr = "10.0.0.128/26"

  private_subnet_name = "private-subnet"
  private_subnet_cidr = "10.0.0.192/26"
}

