variable "folder_name" {
  description = "Folder that the resource belongs to. If value is omitted, the default provider folder is used"
  type        = string
  default     = ""
}

variable "registry" {
  description = "Container registry name"
  type        = string
}

variable "labels" {
  description = "Container registry labels"
  type        = map(string)
  default     = {}
}

// https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/container_registry_iam_binding
variable "members" {
  description = "The role that should be applied"
  type        = list(string)
  default     = ["system:allUsers"]
}

// https://cloud.yandex.com/en/docs/container-registry/security/
variable "role" {
  description = "The role that should be applied"
  type        = string
  default     = "puller"

  validation {
    condition     = contains(["puller", "pusher", "admin"], var.role)
    error_message = "role must be one of `puller`, `pusher` or `admin`"
  }
}

variable "repos" {
  description = "Repositories with role binding and lifecycle_policy"
  type        = map(any)
  default     = {}
}
