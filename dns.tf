resource "digitalocean_domain" "sysopsdns" {
  name = "sysops.com.co"
}

# Add a record to the domain
resource "digitalocean_record" "jenkins" {
  domain = digitalocean_domain.sysopsdns.name
  type   = "A"
  name   = "jenkins"
  ttl    = "30"
  value  = digitalocean_droplet.server.0.ipv4_address
}
