locals {
  package_version = "${var.version}-1000"
}

source "docker" "nomad" {
  image       = "hashicorp/nomad:${var.version}"
  run_command = ["-d", "-i", "-t", "--entrypoint=/bin/sh", "--", "{{.Image}}"]
  discard     = true
  platform    = "${var.os}/${var.arch}"
}

build {
  sources = ["sources.docker.nomad"]

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
      "cp /bin/nomad ./package/bin/nomad",
      "tar czf package.tgz -C package .",
      "tar cf \"nomad_${var.version}_${var.os}_${var.arch}.spk\" INFO LICENSE conf/ package.tgz scripts/pre* scripts/post* scripts/start* WIZARD_UIFILES/*",
    ]
  }

  provisioner "file" {
    source      = "nomad_${var.version}_${var.os}_${var.arch}.spk"
    destination = "${path.cwd}/${var.dest_dir}/nomad_${var.version}_${var.os}_${var.arch}.spk"
    direction   = "download"
  }

  post-processor "manifest" {
    output      = "${path.cwd}/${var.dest_dir}/nomad-manifest.json"
    strip_path  = true
    custom_data = local.metadata
  }
}
