output "s3_buckets" {
  value = [
    aws_s3_bucket.la_huella_sentiment_reports.bucket,
    aws_s3_bucket.la_huella_uploads.bucket
  ]
}

output "dynamodb_tables" {
  value = [
    aws_dynamodb_table.la_huella_comments.name,
    aws_dynamodb_table.la_huella_products.name,
    aws_dynamodb_table.la_huella_analytics.name
  ]
}

output "sqs_queues" {
  value = [
    aws_sqs_queue.la_huella_processing_queue.name,
    aws_sqs_queue.la_huella_notifications_queue.name
  ]
}

output "log_group" {
  value = aws_cloudwatch_log_group.la_huella_aplication.name
}