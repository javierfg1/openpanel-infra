resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.prefix}-vpc"
  }
}


resource "aws_subnet" "public" {
  count                   = min(3,length("us-east-1"))
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "us-east-1"
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.prefix}-subnet-public-${"us-east-1"}"
    Tier = "public"
  }
}

resource "aws_security_group" "openpanel" {
  name        = "openpanel_sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "OpenPanel security group."
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-openpanel-sg"
  }
}

resource "aws_s3_bucket" "openpanel_messages1" {
  bucket = "openpanel_messages1"
}

resource "aws_s3_bucket" "openpanel_messages2" {
  bucket = "openpanel_messages2"
}

resource "aws_dynamodb_table" "openpanel_comments" {
  name         = "openpanel-comments"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "openpanel_products" {
  name         = "openpanel-products"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "openpanel_analytics" {
  name         = "openpanel-analytics"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_sqs_queue" "openpanel_processing_queue" {
  name = "openpanel-processing-queue"
}

resource "aws_sqs_queue" "openpanel_notifications_queue" {
  name = "openpanel-notifications-queue"
}

resource "aws_cloudwatch_log_group" "openpanel_aplication" {
  name              = "/openpanel-aplication"
  retention_in_days = 30
}
