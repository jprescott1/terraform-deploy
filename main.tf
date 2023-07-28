# Store Terraform state in a Google Cloud Storage bucket
terraform {
  backend "gcs" {
    bucket = "do-tf-state"
    prefix = "./tf-deploy"
  }
}

data "digitalocean_ssh_key" "terraform" {
  name = "m1-mac"
}
