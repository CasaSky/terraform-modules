variable "description" {
  description = "The description of your key"
}

variable "customer_master_key_spec" {
  description = "The specification of the encryption used for the key"
  default     = "SYMMETRIC_DEFAULT"
}

variable "alias" {
  description = "The custom display name of your kms alias"
}