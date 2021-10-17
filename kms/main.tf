resource "aws_kms_key" "key" {
  description              = var.description
  customer_master_key_spec = var.customer_master_key_spec
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.key.key_id
}