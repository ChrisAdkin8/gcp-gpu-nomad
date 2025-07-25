variable "gcp_region" {
  description = "Google Cloud region"
  default     = "europe-west1"
}
# variable "gcp_zone" {
#   description = "Google Cloud region"
#   validation {
#     # Validating that zone is within the region
#     condition     = var.gcp_zone == regex("[a-z]+-[a-z]+[0-1]-[abc]",var.gcp_zone)
#     error_message = "The GCP zone ${var.gcp_zone} needs to be a valid one."
#   }

# }
variable "gcp_zones" {
  description = "Zones to spread the clients. This is a list of zones"
  type        = list(string)
  default     = ["europe-west1-c"]
  # Let's do a validation to check that the zones are within the region
  validation {
    condition     = alltrue([for zone in var.gcp_zones : contains(regexall("[a-z]+-[a-z]+[0-1]-[a-z]", zone), zone)])
    error_message = "The GCP zones ${join(",", var.gcp_zones)} needs to be a valid one."
  }
}
variable "gcp_project" {
  description = "Cloud project"
}
variable "gcp_instance" {
  description = "Machine type for nodes"
}
# variable "gcp_zones" {
#   description = "availability zones"
#   type = list(string)
# }
variable "server_nodes" {
  description = "number of server nodes"
  default     = 3
}
variable "nomad_clients" {
  description = "number of client nodes"
  default     = 2
}
variable "cluster_name" {
  description = "Name of the cluster"
}
variable "owner" {
  description = "Owner of the cluster"
}
variable "server" {
  description = "Prefix for server names"
  default     = "consul-server"
}
variable "consul_license" {
  description = "Consul Enterprise license text"
}
variable "nomad_license" {
  description = "Nomad Enterprise license text"
}
variable "tfc_token" {
  description = "Terraform Cloud token to use for CTS"
  default     = ""
}

variable "consul_bootstrap_token" {
  description = "Terraform Cloud token to use for CTS"
  default     = "Consu43v3r"
}

variable "image_family" {
  default = "hashistack"
}

variable "dns_zone" {
  description = "An already existing DNS zone in your GCP project"
  default     = null
}

variable "consul_partitions" {
  description = "List of Consul Admin Partitions"
  type        = list(string)
  default     = []
}

variable "use_hcp_packer" {
  description = "Use HCP Packer to store images"
  default     = false
}

variable "hcp_packer_bucket" {
  description = "Bucket name for HCP Packer"
  default     = "consul-nomad"
}

variable "hcp_packer_channel" {
  description = "Channel for HCP Packer"
  default     = "latest"
}

variable "hcp_packer_region" {
  description = "Region for HCP Packer"
  default     = "europe-west1-c"
}
variable "hcp_project_id" {
  description = "HCP Project ID"
}

variable "enable_cts" {
  description = "Set it to true to deploy a node for CTS"
  default     = "false"
}

variable "subnetwork_cidr" {
  description = "CIDR for the subnetwork"
  default     = "10.2.0.0/16"
}

variable "nomad_client_disk_size" {
  description = "Disk size for Nomad nodes"
  type        = number
  default     = 100
}

variable "nomad_client_machine_type" {
  description = "Machine type for nodes"
  default     = "c2-standard-30"
}

variable "nomad_client_preemptible" {
  description = "Use preemptible VMs for Nomad clients"
  type        = bool
  default     = false
}

variable "nomad_gpu_clients" {
  description = "number of gpu client nodes"
  default     = 0
}

variable "compute_sa_roles" {
  type = set(string)
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/stackdriver.resourceMetadata.writer",
    "roles/compute.networkViewer",
    "roles/storage.objectViewer",
  ]
}

variable "letsencrypt_email" {
  description = "Email for Let's Encrypt"
}
