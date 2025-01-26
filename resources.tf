
resource docker_image image {
  for_each     = var.containers
  
  name         = each.value["image"]
  keep_locally = true
}

resource docker_container server {
  for_each  = var.containers
  
  name      = each.key
  image     = docker_image.image[ each.key ].name
  hostname  = "${ each.key }.${ var.domain_name }"

  networks_advanced {
    name    = var.network_bridge
  }

  env = var.env

  ports {
    internal = var.int_port
    external = "${ each.value["ext_port"] }"
  }
}
