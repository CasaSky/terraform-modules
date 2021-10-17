resource "aws_kms_key" "this" {
  description              = var.description
  customer_master_key_spec = var.customer_master_key_spec
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.this.key_id
}