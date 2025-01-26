
# Various output block examples
# - Note: the use of locals block to (slightly) simplify output value expressions

locals {
    ip_addresses = module.docker-instances.ip_addresses
    ext_ports    = module.docker-instances.ext_ports
}

# curl commands to curl directly to container ip addresses on bridge network:
#
output curl_container_commands {
    #value = join("\n", [ for idx, c in keys( module.docker-instances.ip_addresses) :
    #  format("%d: %s", idx,
    #    "curl -s ${ module.docker-instances.ip_addresses[c] }") ])
    value = join("\n", [ for idx, c in keys( local.ip_addresses) :
        format("%d: %s", idx, "curl -s ${ local.ip_addresses[c] }") ])
}

# curl commands to curl to the exposed port on the host's localhost address:
#
output curl_localhost_commands {
    #value = join("\n", [ for idx, c in keys( module.docker-instances.ext_ports) :
    #  format("%s: %s", idx,
    #    "curl -s 127.0.0.1:${ module.docker-instances.ext_ports[c] }") ])
    value = join("\n", [ for idx, c in keys( local.ext_ports) :
        format("%s: %s", idx, "curl -s 127.0.0.1:${ local.ext_ports[c] }") ])
}

# List exposed ports by container name:
#
output ext_ports {
    #value = { for idx, c in keys( module.docker-instances.ext_ports) : c => module.docker-instances.ext_ports[c] }
    value = { for idx, c in keys( local.ext_ports) : c => local.ext_ports[c] }
}

# List ip_addresses by container name:
#
output ip_addresses {
    #value = { for idx, c in keys( module.docker-instances.ip_addresses) : c => module.docker-instances.ip_addresses[c] }
    value = { for idx, c in keys( local.ip_addresses) : c => local.ip_addresses[c] }
}

output listing {
    value = join("\n", [ for c in keys( local.ip_addresses ) :
        format("Container %s has ip address %s on network %s", c, local.ip_addresses[c], var.network_bridge) ])
}

output listing2 {
    value = join("\n", [ for c in keys( local.ip_addresses ) :
        format("Container %s is exposed on port %s on localhost", c, local.ext_ports[c]) ])
}

