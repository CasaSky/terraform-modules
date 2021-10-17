resource "aws_sqs_queue" "sqs" {
  name                      = var.name
  delay_seconds = var.delay_seconds
}