resource "aws_kms_key" "this" {
  provider = aws.alternate

  description              = var.description
  customer_master_key_spec = var.customer_master_key_spec

  tags = var.tags
}

resource "aws_kms_alias" "this" {
  provider = aws.alternate

  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.this.key_id
}