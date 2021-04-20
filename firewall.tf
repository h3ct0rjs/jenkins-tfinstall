
############################################
# Firewall Rules for our Webserver Droplets 
############################################
resource "digitalocean_firewall" "web" {

    name = var.firewall_name
    droplet_ids = digitalocean_droplet.server.*.id

    #----------------------------------#
    # Selective Inbound Traffic Rules #
    #----------------------------------#
    inbound_rule {
        protocol = "tcp"
        port_range = "1-65535"
        source_addresses = [digitalocean_vpc.web_vpc.ip_range]
    }

    inbound_rule {
        protocol = "udp"
        port_range = "1-65535"
        source_addresses = [digitalocean_vpc.web_vpc.ip_range]
    }

    inbound_rule {
        protocol = "tcp"
        port_range = "22"
        source_addresses = [var.home_ip]
    }

    #Jenkins
    inbound_rule {
        protocol = "tcp"
        port_range = "8080"
        source_addresses = [var.home_ip]
    }
    
    #----------------------------------#
    # Selective Outbound Traffic Rules #
    #----------------------------------#
    outbound_rule {
        protocol = "udp"
        port_range = "1-65535"
        destination_addresses = [digitalocean_vpc.web_vpc.ip_range]
    }

    outbound_rule {
        protocol = "tcp"
        port_range = "1-65535"
        destination_addresses = [digitalocean_vpc.web_vpc.ip_range]
    }

       # DNS
    outbound_rule {
        protocol = "udp"
        port_range = "53"
        destination_addresses = ["0.0.0.0/0"]
    }

    # HTTP
    outbound_rule {
        protocol = "tcp"
        port_range = "80"
        destination_addresses = ["0.0.0.0/0"]
    }

    # HTTPS
    outbound_rule {
        protocol = "tcp"
        port_range = "443"
        destination_addresses = ["0.0.0.0/0"]
    }

    # ICMP (Ping)
    outbound_rule {
        protocol              = "icmp"
        destination_addresses = ["0.0.0.0/0"]
    }
}
