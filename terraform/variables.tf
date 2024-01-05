variable "api_services" {
  default = [
    "compute.googleapis.com",
  ]
  description = "The billing account used by the project"
  type        = list
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

variable "redirects" {
  default     = {
    broadinstitute_mobi = {
      redirect       = "www.broadinstitute.org"
      hostname       = [ "www.broadinstitute.mobi", "broadinstitute.mobi" ]
      https_redirect = true
    }
  }
  description = "The data used to create all the redirects"
  type        = map
}
