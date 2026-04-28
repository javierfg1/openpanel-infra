variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_endpoint" {
  description = "Custom AWS endpoint (LocalStack). Set to null for real AWS."
  type        = string
  default     = "http://localstack.local:4566"
}


variable "prefix" {
  description = "Prefix of the name of the created resources"
  type        = string
  default     = "openpanel"
}

variable "region" {
  description = "The selected AWS region for the VPC"
  type        = string
  default     = "us-east-1"
}

variable "vpc-cidr" {
  description = "The address range of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}