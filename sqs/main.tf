resource "aws_sqs_queue" "this" {
  name          = var.name
  delay_seconds = var.delay_seconds
}