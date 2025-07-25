variable "api_services" {
  default = [
    "certificatemanager.googleapis.com",
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

variable "folder_id" {
  description = "The ID for the folder in which the project should reside"
  type        = string
}

variable "http_redirects" {
  description = "The map of redirects to create."
  type = map(object({
    certificates                   = map(list(string))
    default_destination_host       = optional(string, "www.broadinstitute.org")
    default_destination_path       = optional(string, "/")
    default_redirect_response_code = optional(string, "MOVED_PERMANENTLY_DEFAULT")
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
