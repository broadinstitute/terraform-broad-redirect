locals {
  all_hosts = flatten([
    for cert, data in var.http_redirects : flatten([
      for name, hosts in data.certificates :
        hosts
    ])
  ])
}

resource "google_compute_ssl_policy" "redirects" {
  description     = "TLS policy for redirects"
  min_tls_version = "TLS_1_2"
  name            = "redirects-tls-policy"
  profile         = "MODERN"
}

resource "google_certificate_manager_dns_authorization" "domains" {
  for_each = toset(local.all_hosts)

  description = "DNS authorization for ${each.key}"
  domain      = each.key
  name        = replace(each.key, ".", "-")
  type        = "PER_PROJECT_RECORD"
}

module "http_redirects" {
  for_each = var.http_redirects
  source   = "github.com/broadinstitute/terraform-google-redirect//modules/http_redirects?ref=tex/dnsauth"

  certificates                   = each.value.certificates
  default_destination_host       = each.value.default_destination_host
  default_destination_path       = each.value.default_destination_path
  default_redirect_response_code = each.value.default_redirect_response_code
  dns_authorizations             = google_certificate_manager_dns_authorization.domains
  name                           = each.key
  project                        = google_project.redirects.project_id
  redirects                      = each.value.redirects
  ssl_policy                     = google_compute_ssl_policy.redirects.self_link
}
