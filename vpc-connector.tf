resource "google_vpc_access_connector" "connector" {
  name          = var.vpc_connector_name
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.vpc_connector_cidr
}
