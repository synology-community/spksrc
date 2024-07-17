variable "version" {
  type        = string
  description = "The version of the Nomad server to deploy"
  default     = "1.8.2"
}

variable "os" {
  type        = string
  description = "The OS to use for the Nomad server"
  default     = "linux"
}

variable "arch" {
  type        = string
  description = "The architecture to use for the Nomad server"
  default     = "amd64"
}

variable "os_min_ver" {
  type        = string
  description = "The minimum OS version to use for the Nomad server"
  default     = "7.0-40356"
}

variable "os_max_ver" {
  type        = string
  description = "The maxiumum OS version to use for the Nomad server"
  default     = ""
}
