resource "google_compute_ssl_policy" "redirects" {
  description     = "TLS policy for redirects"
  min_tls_version = "TLS_1_2"
  name            = "redirects-tls-policy"
  profile         = "MODERN"
}
