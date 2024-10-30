variable "project_id" {
  description = "Your Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Region for the GKE cluster"
  default     = "us-west1"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  default     = "my-gke-cluster"
}
