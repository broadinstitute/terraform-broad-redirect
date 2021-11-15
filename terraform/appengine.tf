# resource "google_app_engine_standard_app_version" "redirect_app" {
#   delete_service_on_destroy = true
#   runtime                   = "python39"
#   service                   = "redirect_app"
#   version_id                = "v1"

#   automatic_scaling {
#     max_concurrent_requests = 10
#     max_idle_instances = 3
#     max_pending_latency = "5s"
#     min_idle_instances = 1
#     min_pending_latency = "1s"

#     standard_scheduler_settings {
#       max_instances = 10
#       min_instances = 2
#       target_cpu_utilization = 0.5
#       target_throughput_utilization = 0.75
#     }
#   }
# }

resource "google_compute_region_network_endpoint_group" "redirect_app" {
  name                  = "redirect-app"
  network_endpoint_type = "SERVERLESS"
  region                = var.region

  # app_engine {
  #   service = google_app_engine_standard_app_version.redirect_app.service
  #   version = google_app_engine_standard_app_version.redirect_app.version_id
  # }

  # If we do deploys outside Terraform
  app_engine {
    service = var.app_service_name
    version = var.app_version
  }
}

resource "google_compute_backend_service" "redirect_app" {
  connection_draining_timeout_sec = 10
  name                            = "redirect-app"
  timeout_sec                     = 10

  backend {
    group = google_compute_region_network_endpoint_group.redirect_app.id
  }
}
