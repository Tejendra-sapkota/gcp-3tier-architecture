# -----------------------------
# Core project settings
# -----------------------------
project_id = "plasma-moment-484922-t5"
region     = "us-central1"

# -----------------------------
# Networking
# -----------------------------
vpc_name = "prod-vpc"

subnet_cidrs = {
  public       = "10.10.0.0/24"
  private_app  = "10.10.10.0/24"
  private_data = "10.10.20.0/24"
}

# -----------------------------
# Cloud Run VPC Connector
# -----------------------------
vpc_connector_name = "cr-connector"
vpc_connector_cidr = "10.8.0.0/28"

# -----------------------------
# Cloud Run
# -----------------------------
cloudrun_web_name  = "web-service"
cloudrun_image_web = "gcr.io/cloudrun/hello"

# -----------------------------
# Cloud SQL (Private IP)
# -----------------------------
sql_instance_name    = "app-db"
sql_database_version = "MYSQL_8_0"
sql_tier             = "db-f1-micro"

# -----------------------------
# Private Service Access
# -----------------------------
private_service_prefix_length = 16

# -----------------------------
# DNS / Load Balancer
# -----------------------------
domain_name = "spice505.com"

lb_name    = "gcp3-https-lb"
lb_domain  = "app.spice505.com"
lb_ip_name = "gcp3-lb-ip"
