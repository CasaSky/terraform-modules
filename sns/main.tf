resource "aws_sns_topic" "this" {
  provider = aws.alternate

  name              = var.name
  kms_master_key_id = var.kms_master_key_id

  tags = var.tags
}