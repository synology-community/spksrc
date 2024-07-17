locals {
  metadata = {
    package                    = "nomad"
    version                    = var.version
    arch                       = "noarch"
    thirdparty                 = "yes"
    description                = "Orchestration Made Easy by HashiCorp Nomad."
    displayname                = "HashiCorp Nomad"
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
    link                       = "${var.url}${var.dest_dir}/nomad_${var.version}_${var.os}_${var.arch}.spk"
  }

  info = join("\n", formatlist("%s=\"%s\"", keys(local.metadata), values(local.metadata)))
}