###################
# Global Variables. #
#####################

# Our DigitalOcean API token.
variable "do_token_h" {
  type = string 
}

# Name of your SSH Key
variable ssh_key_main {
    type = string
    default = "./id_rsa.pub"
}

variable "home_ip" {
    type = string
    default = "x.x.x.x/32"
}

# Name of your project.
variable "name" {
    type = string
    default = "jenkins-lab"
}

# Name of your project.
variable "vpcname" {
    type = string
    default = "sysops-vpc"
}
variable "firewall_name"{
    type = string
    default = "labs-firewall"
}

# The region to deploy our infrastructure to.
variable "region" {
    type    = string
    default = "sfo3"
}

# The number of droplets to create.
variable "droplet_count" {
    type = number
    default = 1
}

# The size we want our droplets to be. 
# Can view slugs (valid options) https://slugs.do-api.dev/
# curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer DO_TOKEN" "https://api.digitalocean.com/v2/sizes" | jq
variable "droplet_size" {
    type = string
    default = "s-2vcpu-4gb"
}

# The operating system image we want to use. 
# Can view slugs (valid options) https://slugs.do-api.dev/
# curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer DO_TOKEN" "https://api.digitalocean.com/v2/images?page=1&per_page=20&type=distribution" | jq
variable "image" {
    type = string
    default = "ubuntu-18-04-x64"
}
