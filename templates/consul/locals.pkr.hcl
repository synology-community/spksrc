locals {
  metadata = {
    package                    = "consul"
    version                    = var.version
    arch                       = "noarch"
    thirdparty                 = "yes"
    description                = "Service Discovery Made Easy by HashiCorp Consul."
    displayname                = "HashiCorp Consul"
    maintainer                 = "Nigel Bazzeghin"
    maintainer_url             = "https://github.com/nbazzeghin/synology-consul"
    create_time                = formatdate("YYYYMMDD-hh:mm:ss", timestamp())
    support_conf_folder        = "yes"
    startstop_restart_services = "nginx"
    os_min_ver                 = var.os_min_ver
    os_max_ver                 = var.os_max_ver
    silent_install             = "no"
    silent_uninstall           = "no"
    silent_upgrade             = "no"
    beta                       = "yes"
    # package_icon_128           = filebase64("package/ui/images/consul.png")
    # package_icon_256           = filebase64("package/ui/images/consul_256.png")
  }

  info = join("\n", formatlist("%s=\"%s\"", keys(local.metadata), values(local.metadata)))
}