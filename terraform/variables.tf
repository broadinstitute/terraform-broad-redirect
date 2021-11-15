variable "app_service_name" {
  default     = "redirect-app"
  description = "The name of the AppEngine service"
  type        = string
}

variable "app_version" {
  default     = "v1"
  description = "The version ID of the AppEngine service"
  type        = string
}

variable "project" {
  description = "The deployment project"
  type        = string
}

# # tflint-ignore: terraform_unused_declarations
variable "region" {
  description = "The deployment region"
  type        = string
}
