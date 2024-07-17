locals {
  metadata = {
    package                    = "vault"
    version                    = var.version
    arch                       = "noarch"
    thirdparty                 = "yes"
    description                = "Secrets Made Easy by HashiCorp Vault."
    displayname                = "HashiCorp Vault"
    maintainer                 = "Appkins"
    maintainer_url             = "https://github.com/synology-community/spksrc"
    create_time                = formatdate("YYYYMMDD-hh:mm:ss", timestamp())
    support_conf_folder        = "yes"
    startstop_restart_services = "nginx"
    os_min_ver                 = var.os_min_ver
    os_max_ver                 = var.os_max_ver
    silent_install             = "no"
    silent_uninstall           = "no"
    silent_upgrade             = "no"
    beta                       = "yes"
    link                       = "${var.url}${var.dest_dir}/vault_${var.version}_${var.os}_${var.arch}.spk"
  }

  info = join("\n", formatlist("%s=\"%s\"", keys(local.metadata), values(local.metadata)))
}