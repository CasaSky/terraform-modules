variable "name" {
  description = "The name of your sns topic"
}

variable "kms_master_key_id" {
  description = "The ID of your CMK for server-side encryption"
  default     = ""
}

variable "tags" {
  description = "A Map of tags to assign to the object"
  default     = {}
}