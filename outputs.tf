# The Private IPv4 Addresses of the droplets
output "web_servers_private" {
    value = digitalocean_droplet.server.*.ipv4_address_private
}

output "web_servers_public" {
    value = digitalocean_droplet.server.*.ipv4_address
}