variable "function_name" {
  description = "The name of your lambda function"
}

variable "handler" {
  description = "The entrypoint of your function"
}

variable "runtime" {
  description = "The runtime identifier of your function"
}

variable "filepath" {
  description = "The path of your function deployment package"
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed"
  default     = 1
}

variable "kms_master_key_id" {
  description = "The ID of your CMK for server-side encryption"
  default     = ""
}