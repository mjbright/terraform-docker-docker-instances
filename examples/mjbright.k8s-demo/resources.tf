
module docker-instances {
    #source = "../.."
    source = "registry.terraform.io/mjbright/docker-instances/docker"
    
    containers     = var.containers

    network_bridge = var.network_bridge
    int_port       = var.int_port
    domain_name    = var.domain_name
}
