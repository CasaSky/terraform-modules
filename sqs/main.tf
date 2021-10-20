resource "aws_sqs_queue" "this" {
  provider                  = aws.alternate
  name                      = var.name
  delay_seconds             = var.delay_seconds
  message_retention_seconds = var.message_retention_seconds
  redrive_policy            = var.redrive_policy
  kms_master_key_id         = var.kms_master_key_id

  tags = var.tags
}