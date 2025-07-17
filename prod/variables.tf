variable "api_services" {
  default = [
    "compute.googleapis.com",
  ]
  description = "The billing account used by the project"
  type        = list(any)
}

variable "billing_account" {
  description = "The billing account used by the project"
  type        = string
}

variable "cost_object" {
  description = "The cost object that pays for the project"
  type        = string
}

variable "domain_redirects" {
  default     = {}
  description = "The data used to create all the domain-level redirects"
  type = map(object({
    redirect       = string
    hostname       = list(string)
    https_redirect = bool
  }))
}

variable "folder_id" {
  description = "The ID for the folder in which the project should reside"
  type        = string
}

variable "path_redirects" {
  description = "The map of redirects to apply to the path under the hostname."
  type = map(object({
    default_destination_host = optional(string, "www.broadinstitute.org")
    default_destination_path = optional(string, "/")
    hostnames                = list(string)
    redirects = list(object({
      destination_host       = string
      destination_path       = string
      redirect_response_code = optional(string, "MOVED_PERMANENTLY_DEFAULT")
      source_paths           = list(string)
    }))
  }))
}

variable "project" {
  description = "The project ID used for this project"
  type        = string
}

variable "project_name" {
  description = "The descriptive name for the project"
  type        = string
}

# # tflint-ignore: terraform_unused_declarations
variable "region" {
  description = "The deployment region"
  type        = string
}
