module "domain_redirects" {
  for_each       = var.redirects
  host_redirect  = each.value.redirect
  hostname       = each.value.hostname
  https_redirect = each.value.https_redirect
  source         = "github.com/broadinstitute/terraform-google-domain-redirect?ref=multihost"
  # source         = "simplycubed/domain-redirect/google"
  # version        = "1.0.0"
}
