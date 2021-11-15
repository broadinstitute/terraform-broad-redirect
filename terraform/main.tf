data "google_project" "project" {}

resource "google_project_iam_policy" "broad_redirect" {
  policy_data = data.google_iam_policy.admin.policy_data
  project     = var.project
}

data "google_iam_policy" "admin" {
  # binding {
  #   members = [
  #     "group:operations@broadinstitute.org",
  #   ]
  #   role = "roles/owner"
  # }

}
