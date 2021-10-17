resource "aws_sqs_queue" "this" {
  name                      = var.name
  delay_seconds             = var.delay_seconds
  message_retention_seconds = var.message_retention_seconds

  tags = var.tags
}