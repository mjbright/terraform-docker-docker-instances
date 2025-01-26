
module docker-vms {
    #source = "../.."
    source = "mjbright/terraform-docker-instances"
    
    containers     = var.containers

    network_bridge = var.network_bridge
    int_port       = var.int_port
    domain_name    = var.domain_name
}
