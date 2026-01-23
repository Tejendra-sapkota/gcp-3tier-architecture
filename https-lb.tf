############################################
# Global Static IP for HTTPS Load Balancer
############################################
resource "google_compute_global_address" "lb_ip" {
  name = var.lb_ip_name
}

############################################
# Serverless NEG for Cloud Run
############################################
resource "google_compute_region_network_endpoint_group" "cloudrun_neg" {
  name                  = "${var.lb_name}-neg"
  region                = var.region
  network_endpoint_type = "SERVERLESS"

  cloud_run {
    service = google_cloud_run_service.web.name
  }
}

############################################
# Backend Service
############################################
resource "google_compute_backend_service" "lb_backend" {
  name                  = "${var.lb_name}-backend"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"

  backend {
    group = google_compute_region_network_endpoint_group.cloudrun_neg.id
  }
}

############################################
# URL Map
############################################
resource "google_compute_url_map" "lb_url_map" {
  name            = "${var.lb_name}-url-map"
  default_service = google_compute_backend_service.lb_backend.id
}

############################################
# Managed SSL Certificate
############################################
resource "google_compute_managed_ssl_certificate" "lb_cert" {
  name = "${var.lb_name}-cert"

  managed {
    domains = [var.lb_domain]
  }
}

############################################
# HTTPS Target Proxy
############################################
resource "google_compute_target_https_proxy" "lb_https_proxy" {
  name    = "${var.lb_name}-https-proxy"
  url_map = google_compute_url_map.lb_url_map.id
  ssl_certificates = [
    google_compute_managed_ssl_certificate.lb_cert.id
  ]
}

############################################
# Global Forwarding Rule (HTTPS)
############################################
resource "google_compute_global_forwarding_rule" "lb_forwarding_rule" {
  name                  = "${var.lb_name}-fwd-rule"
  ip_address            = google_compute_global_address.lb_ip.address
  port_range            = "443"
  target                = google_compute_target_https_proxy.lb_https_proxy.id
  load_balancing_scheme = "EXTERNAL_MANAGED"
}
