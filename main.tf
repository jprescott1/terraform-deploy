# Store Terraform state in a Google Cloud Storage bucket
terraform {
  backend "gcs" {
    bucket = "do-tf-state"
    prefix = "./tf-deploy"
  }
}

resource "digitalocean_kubernetes_cluster" "terra-sfo3" {
  name   = "terra-sfo3"
  region = "sfo3"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.29.1-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3
  }
}