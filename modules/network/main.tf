terraform {
  required_version = ">= 0.12"
}

# vpc
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

# public subnet 
resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = var.public_subnet_cidr
  network       = google_compute_network.vpc.name
  depends_on    = [google_compute_network.vpc]
}

# private subnet
resource "google_compute_subnetwork" "private_subnet" {
  name                     = var.private_subnet_name
  ip_cidr_range            = var.private_subnet_cidr
  network                  = google_compute_network.vpc.name
  private_ip_google_access = true
  depends_on               = [google_compute_network.vpc]
}

