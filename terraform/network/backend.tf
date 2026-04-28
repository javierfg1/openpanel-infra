terraform {
  backend "s3" {
    bucket                      = "la-huella-remote-state"
    key                         = "mission7/terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "http://midominio.local"
    dynamodb_endpoint           = "http://midominio.local"

    dynamodb_table              = "terraform-locks"

    access_key                  = "test"
    secret_key                  = "test"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true

    force_path_style            = true
  }
}