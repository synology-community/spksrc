packer {
  required_version = ">= 1.11.0"
  required_plugins {
    docker = {
      version = ">= 1.0.10"
      source  = "github.com/hashicorp/docker"
    }
  }
}