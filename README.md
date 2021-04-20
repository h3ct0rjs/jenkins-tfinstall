# jenkins-tfinstall

This terraform project will create the complete infrastructure  for a jenkins server using the last version of the provider for digital ocean. 

The folder architecture is the _following_ : 

* cloudinit.yaml : This file contain the cloud init config to install docker and run the docker image community for jenkins.
* dns.tf :  This file contains a resource that create a new subdomain with name jenkins.sysops.com.co, change the domain name to your domain.
* networking.tf : All the vpc definition is here.
* firewall.tf : All the firewall security configurations, inbound and outbound rules.
* outputs.tf : Define the outputs after all cloud resources has been created.
* provider.tf : This sets our version provider.
* server.tf  : Sets all the parameter for the server configuration, size the ssh key among other things.

## Configurations: 

You can experiment with this terraform, The code don't implement tf standards, you should check the file with name **variables.tf**, and set  _home_ip_, change the code as it's presented below: 

```tf
variable "home_ip" {
    type = string
    default = "1.2.3.4/32"
}
```

you will need to create an API Personal Token on the dashboard of Digital Ocean, after then 
export TF_VAR_do_token_h="PASTE_TOKEN_HERE"

