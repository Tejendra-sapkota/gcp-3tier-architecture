########################################
# Core Project Settings
########################################
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

########################################
# Networking
########################################
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "subnet_cidrs" {
  description = "CIDR ranges for subnets"
  type        = map(string)
}

########################################
# Cloud Run VPC Connector
########################################
variable "vpc_connector_name" {
  description = "Cloud Run VPC Access connector name"
  type        = string
}

variable "vpc_connector_cidr" {
  description = "CIDR range for Cloud Run VPC connector (/28)"
  type        = string
}

########################################
# Cloud Run (Web Tier)
########################################
variable "cloudrun_web_name" {
  description = "Cloud Run web service name"
  type        = string
}

variable "cloudrun_image_web" {
  description = "Container image for web Cloud Run service"
  type        = string
}

########################################
# Cloud SQL (Data Tier)
########################################
variable "sql_instance_name" {
  description = "Cloud SQL instance name"
  type        = string
}

variable "sql_database_version" {
  description = "Cloud SQL database version (e.g. MYSQL_8_0)"
  type        = string
}

variable "sql_tier" {
  description = "Cloud SQL machine tier (e.g. db-f1-micro)"
  type        = string
}

########################################
# Private Service Access (for Cloud SQL)
########################################
variable "private_service_prefix_length" {
  description = "Prefix length for private service access range"
  type        = number
}

########################################
# DNS
########################################
variable "domain_name" {
  description = "Public DNS domain name (example: example.com)"
  type        = string
}

########################################
# HTTPS Load Balancer (Cloud Run Frontend)
########################################
variable "lb_name" {
  description = "Base name for HTTPS Load Balancer"
  type        = string
}

variable "lb_domain" {
  description = "Fully qualified domain name for HTTPS Load Balancer (e.g. app.example.com)"
  type        = string
}

variable "lb_ip_name" {
  description = "Name of the global static IP for the Load Balancer"
  type        = string
}
