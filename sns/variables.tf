variable "name" {
  description = "The name of your sns topic"
}

variable "kms_master_key_id" {
  description = "The ID of your CMK for server-side encryption"
  default     = ""
}

variable "account_ids" {
  description = "List of account ids that should gain access to the created sns topic"
  type        = list(string)
}

variable "tags" {
  description = "A Map of tags to assign to the object"
  default     = {}
}