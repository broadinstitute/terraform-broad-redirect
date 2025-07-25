variable "hostnames" {
  description = "The list of hostname(s) the redirects will apply to."
  type        = list(string)
}

variable "default_destination_host" {
  description = "The default host to redirect to if no paths are matched."
  type        = string
}

variable "default_destination_path" {
  description = "The default path to redirect to if no paths are matched."
  type        = string
}

variable "redirects" {
  description = "The map of redirects to apply to the path under the hostname."
  type = list(object({
    destination_host       = string
    destination_path       = string
    redirect_response_code = string
    source_paths           = list(string)
  }))
}

variable "ssl_policy" {
  default     = null
  description = "The SSL policy to use for the redirects."
  type        = string
}
