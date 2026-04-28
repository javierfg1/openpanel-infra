variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_endpoint" {
  description = "Custom AWS endpoint (LocalStack). Set to null for real AWS."
  type        = string
  default     = "http://midominio.local"
}