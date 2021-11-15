resource "google_compute_global_address" "http_only_domains" {
  name  = "http-only-domains"
}

resource "google_compute_target_http_proxy" "http_only_domains" {
  name    = "http-only-domains"
  url_map = google_compute_url_map.http_only_domains.id
}

resource "google_compute_url_map" "http_only_domains" {
  default_service = google_compute_backend_service.redirect_app.id

  host_rule {
    # harvard points to 69.173.92.32 (hosting.broadinstitute.org)
    # broad.mit.edu points to 69.173.93.33 (root-redirect.broadinstitute.org)
    # www.broad.mit.edu CNAMEs to whatever www.broadinstitute.org points to currently
    # All wi.mit.edu hostnames no longer point to us
    hosts        = [
      "broad.harvard.edu", "www.broad.harvard.edu", "broad.mit.edu", "www.broad.mit.edu",
    ]
    path_matcher = "allpaths"
  }

  name            = "http-only-domains"
  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.redirect_app.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.redirect_app.id
    }
  }
}

resource "google_compute_global_forwarding_rule" "http_only_domains" {
  ip_address            = google_compute_global_address.http_only_domains.address
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  name                  = "http-only-domains"
  target                = google_compute_target_http_proxy.http_only_domains.id
}
