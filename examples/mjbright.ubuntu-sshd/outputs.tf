
# Various output block examples
# - Note: the use of locals block to (slightly) simplify output value expressions

locals {
    ext_ports    = module.docker-vms.ext_ports
}

# commands to connect to "vm" containers
#
output ssh_commands {
    value = join("\n", [ for idx, c in keys( local.ext_ports ) :
        format("%d: ssh -i ~/.ssh/id_ed25519 -p %s %s@localhost", idx, local.ext_ports[c], var.user) ])
}

