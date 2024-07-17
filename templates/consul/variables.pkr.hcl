variable "version" {
  type        = string
  description = "The version of the Consul server to deploy"
  default     = "1.19.1"
}

variable "os" {
  type        = string
  description = "The OS to use for the Consul server"
  default     = "linux"
}

variable "arch" {
  type        = string
  description = "The architecture to use for the Consul server"
  default     = "amd64"
}

variable "os_min_ver" {
  type        = string
  description = "The minimum OS version to use for the Consul server"
  default     = "7.0-40356"
}

variable "os_max_ver" {
  type        = string
  description = "The maxiumum OS version to use for the Consul server"
  default     = ""
}
