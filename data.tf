resource "google_sql_database_instance" "db" {
  name             = var.sql_instance_name
  database_version = var.sql_database_version
  region           = var.region

  depends_on = [
    google_service_networking_connection.private_vpc_connection
  ]

  settings {
    tier = var.sql_tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }
  }
}

