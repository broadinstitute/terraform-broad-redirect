module "domain_redirects" {
  for_each = var.domain_redirects
  source   = "github.com/broadinstitute/terraform-google-domain-redirect?ref=multihost"

  host_redirect  = each.value.redirect
  hostname       = each.value.hostname
  https_redirect = each.value.https_redirect
  name           = each.key
  project        = google_project.redirects.project_id
  ssl_policy     = google_compute_ssl_policy.redirects.self_link
  # source         = "simplycubed/domain-redirect/google"
  # version        = "1.0.0"
}

module "path_redirects" {
  for_each = var.path_redirects
  source   = "../modules/terraform-google-url-redirects"

  default_destination_host = each.value.default_destination_host
  default_destination_path = each.value.default_destination_path
  hostnames                = each.value.hostnames
  name                     = each.key
  redirects                = each.value.redirects
  ssl_policy               = google_compute_ssl_policy.redirects.self_link
}

moved {
  from = module.domain_redirects["broadinstitute.org"]
  to = module.domain_redirects["broadinstitute-org"]
}
moved {
  from = module.path_redirects["proteomics.broadapps.org"]
  to = module.path_redirects["proteomics-broadapps-org"]
}
