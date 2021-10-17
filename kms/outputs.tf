output "kms_master_key_id" {
  value = aws_kms_alias.alias.name
}