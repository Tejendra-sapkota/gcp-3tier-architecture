resource "google_cloud_run_service" "web" {
  name     = var.cloudrun_web_name
  location = var.region

  template {
    metadata {
      annotations = {
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.id
        "run.googleapis.com/vpc-access-egress"    = "all-traffic"
      }
    }

    spec {
      containers {
        image = var.cloudrun_image_web

        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [
    google_vpc_access_connector.connector
  ]
}
