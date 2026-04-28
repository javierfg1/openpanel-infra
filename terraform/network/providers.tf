provider "aws" {
  region = var.aws_region

  # Para LocalStack (opcional)
  endpoints {
    s3         = var.aws_endpoint
    dynamodb   = var.aws_endpoint
    sqs        = var.aws_endpoint
    logs       = var.aws_endpoint
  }

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  s3_use_path_style = true

}