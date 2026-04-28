terraform {
  backend "s3" {
    bucket                      = "openpanel-remote-state"
    key                         = "openpanel/terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "http://milocalstack.local:4566"
    dynamodb_endpoint           = "http://milocalstack.local:4566"

    dynamodb_table              = "terraform-op-locks"

    access_key                  = "test"
    secret_key                  = "test"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true

    force_path_style            = true
  }
}