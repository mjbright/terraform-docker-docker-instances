
module docker-vms {
    #source = "../.."
    source = "mjbright/terraform-docker-instances"
    
    containers     = var.containers

    env            = [
        "SSH_USERNAME=${var.user}",
        "AUTHORIZED_KEYS=${file( var.key_file )}"
    ]

    network_bridge = var.network_bridge
    int_port       = var.int_port
    domain_name    = var.domain_name
}
