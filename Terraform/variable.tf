variable "credentials" {
  description = "Service account credentials"
  type        = string
  default     = "./keys/cred_terraform.json"

}
variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"

}


variable "project" {
  description = "GCP project ID"
  type        = string
  default     = "symbolic-math-436615-q5"

}

variable "location" {
  description = "ALL project location"
  type        = string
  default     = "US"

}

variable "bq_dataset_name" {
  description = "BigQuery dataset name"
  type        = string
  default     = "dataset_zoomcamp"

}
variable "gcs_bucket_name" {
  description = "GCS bucket name"
  type        = string
  default     = "20250301-bucket_data_zoomcamp_mada-terraform"

}