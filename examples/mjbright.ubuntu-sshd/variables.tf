
variable network_bridge {
    type    = string
    default = "apps"
}

variable int_port {
    type    = number
    default = 80
}

variable domain_name {
    type    = string
    default = "local"
}

variable containers {
    type    = map
    default = {}
}

variable user {
    type    = string
    default = "ubuntu"
}

variable key_file {
    type    = string
    default = ""
}

