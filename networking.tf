########################################
# Create a VPC for isolating our traffic
########################################
resource "digitalocean_vpc" "web_vpc"{
    # The human friendly name of our VPC.
    name = var.vpcname

    # The region to deploy our VPC to.
    region = var.region
    
    # The private ip range within our VPC
    ip_range = "10.140.0.0/22"
}
