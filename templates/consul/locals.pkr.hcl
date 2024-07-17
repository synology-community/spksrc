locals {
  metadata = {
    package                    = "consul"
    version                    = var.version
    arch                       = "noarch"
    thirdparty                 = "yes"
    description                = "Service Discovery Made Easy by HashiCorp Consul."
    displayname                = "HashiCorp Consul"
    maintainer                 = "Synology Community"
    maintainer_url             = "https://github.com/synology-community/spksrc"
    create_time                = formatdate("YYYYMMDD-hh:mm:ss", timestamp())
    support_conf_folder        = "yes"
    startstop_restart_services = "nginx"
    os_min_ver                 = var.os_min_ver
    os_max_ver                 = var.os_max_ver
    silent_install             = "no"
    silent_uninstall           = "no"
    silent_upgrade             = "no"
    beta                       = true
    link                       = "${var.url}${var.dest_dir}/consul_${var.version}_${var.os}_${var.arch}.spk"
    # package_icon_128           = filebase64("package/ui/images/consul.png")
    # package_icon_256           = filebase64("package/ui/images/consul_256.png")
  }

  info = join("\n", formatlist("%s=\"%s\"", keys(local.metadata), values(local.metadata)))
}