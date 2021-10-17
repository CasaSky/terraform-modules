variable "name" {
  description = "The name of your sqs queue"
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed"
  default     = 1
}

variable "message_retention_seconds" {
  description = "The number of seconds, SQS retains a message"
  # 1 day retention time
  default = 604800
}

variable "redrive_policy" {
  description = "The JSON policy to set up the Dead Letter Queue"
  default     = ""
}

variable "kms_master_key_id" {
  description = "The ID of your CMK for server-side encryption"
  default     = ""
}

variable "tags" {
  description = "A Map of tags to assign to the object"
  default     = {}
}