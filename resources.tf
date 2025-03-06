
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


  # Shouldn't be necessary: workarounds to prevent unnecessary container re-creations
  #
  # - setting of bridge mode:
  network_mode = "bridge"
  #
  # - ignore replacement due to image name being replaced by sha256 id:
  lifecycle { ignore_changes = [ image ] }
  #
  # NOTE: remove above lifecycle block to allow container recreation on image change


  networks_advanced {
    name    = var.network_bridge
  }

  env = var.env

  ports {
    internal = var.int_port
    external = "${ each.value["ext_port"] }"
  }
}
