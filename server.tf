############################
# Create a Jenkins WebServer 
############################

# Create a new SSH key
resource "digitalocean_ssh_key" "ssh_key_main" {
  name       = "SysOps-Lab"
  public_key = file("/home/c1b3r/.ssh/digitaloceanlab/id_rsa.pub")
}

resource "digitalocean_droplet" "server" {
  
    count = var.droplet_count
    image = var.image
    name = "server-${var.name}-${var.region}-${count.index +1}"
    region = var.region
    size = var.droplet_size
    ssh_keys = [digitalocean_ssh_key.ssh_key_main.fingerprint]
    vpc_uuid = digitalocean_vpc.web_vpc.id
    backups = false
    user_data = file("./cloudinit.yaml")

    # Tags for identifying the droplets and allowing db firewall access
    tags = ["${var.name}-webserver", "terraform"]
    

    lifecycle {
        create_before_destroy = true
    }
}
