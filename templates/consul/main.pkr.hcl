locals {
  package_version = "${var.version}-1000"
}

source "docker" "consul" {
  image       = "hashicorp/consul:${var.version}"
  run_command = ["-d", "-i", "-t", "--entrypoint=/bin/sh", "--", "{{.Image}}"]
  discard     = true
  platform    = "${var.os}/${var.arch}"
}

build {
  sources = ["sources.docker.consul"]

  provisioner "file" {
    sources = [
      "${path.root}/conf",
      "${path.root}/scripts",
      "${path.root}/package",
      "${path.root}/WIZARD_UIFILES",
      "${path.root}/LICENSE"
    ]
    destination = "./"
  }

  provisioner "file" {
    content     = templatefile("templates/info.tpl", local.metadata)
    destination = "INFO"
  }

  provisioner "shell" {
    inline = [
      "mkdir -p ./package/bin",
      "cp /bin/consul ./package/bin/consul",
      "tar czf package.tgz -C package .",
      "tar cf \"consul_${var.version}_${var.os}_${var.arch}.spk\" INFO LICENSE conf/ package.tgz scripts/pre* scripts/post* scripts/start* WIZARD_UIFILES/*",
    ]
  }

  provisioner "file" {
    source      = "consul_${var.version}_${var.os}_${var.arch}.spk"
    destination = "${path.cwd}/${var.dest_dir}/consul_${var.version}_${var.os}_${var.arch}.spk"
    direction   = "download"
  }

  post-processor "manifest" {
    output      = "${path.cwd}/${var.dest_dir}/manifest.json"
    strip_path  = true
    custom_data = local.metadata
  }
}
