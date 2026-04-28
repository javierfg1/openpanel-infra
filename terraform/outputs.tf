output "vpc_id" {
  description = "The id of the VPC."
  value = aws_vpc.vpc.id
}

output "sg_id" {
  description = "The id of the security group."
  value = aws_security_group.openpanel.id
}

output "s3_buckets" {
  value = [
    aws_s3_bucket.openpanel_messages1.bucket,
    aws_s3_bucket.openpanel_messages2.bucket
  ]
}

output "dynamodb_tables" {
  value = [
    aws_dynamodb_table.openpanel_comments.name,
    aws_dynamodb_table.openpanel_products.name,
    aws_dynamodb_table.openpanel_analytics.name
  ]
}

output "sqs_queues" {
  value = [
    aws_sqs_queue.openpanel_processing_queue.name,
    aws_sqs_queue.openpanel_notifications_queue.name
  ]
}

output "log_group" {
  value = aws_cloudwatch_log_group.openpanel_aplication.name
}