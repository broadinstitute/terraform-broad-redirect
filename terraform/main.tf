resource "google_project" "default" {
  auto_create_network = false
  billing_account     = var.billing_account
  folder_id           = var.folder_id
  labels              = { billing = lower(var.billing_account), costobject = "broad-${var.cost_object}" }
  name                = var.project_name
  project_id          = var.project
  skip_delete         = true
}

resource "google_resource_manager_lien" "default" {
  parent       = "projects/${google_project.default.number}"
  restrictions = ["resourcemanager.projects.delete"]
  origin       = "${google_project.default.project_id}-project-lien-protection"
  reason       = "This is the primary project for Broad domain redirects and should never be deleted"
}

resource "google_project_service" "api_services" {
  for_each = toset(var.api_services)
  service = each.key

  disable_dependent_services = false
  disable_on_destroy = false

  depends_on = [
    google_project.default
  ]
}

resource "google_project_iam_policy" "broad_redirect" {
  policy_data = data.google_iam_policy.admin.policy_data
  project     = var.project
}

data "google_iam_policy" "admin" {
  binding {
    members = [
      "group:devnull-sa@broadinstitute.org",
    ]
    role = "roles/owner"
  }
}
