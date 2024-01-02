module "domains" {
  host_redirect  = "www.broadinstitute.org"
  hostname       = "www.broadinstitute.mobi"
  https_redirect = true
  source         = "simplycubed/domain-redirect/google"
  version        = "1.0.0"
}
