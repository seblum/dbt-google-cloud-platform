resource "random_string" "random" {
  length  = 8
  upper   = false
  special = false
}

locals {
  state_bucket_name = "tf-state-bucket-${random_string.random.result}"
}

resource "google_storage_bucket" "terraform_state" {
  name                        = local.state_bucket_name
  location                    = "EU"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  force_destroy               = true

  versioning {
    enabled = true
  }
}