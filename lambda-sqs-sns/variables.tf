variable "function_name" {
  description = "The name of your lambda function"
}

variable "handler" {
  description = "The entrypoint of your function"
}

variable "runtime" {
  description = "The runtime identifier of your function"
}

variable "memory_size" {
  description = "The amount of memory in MB your lambda function can use at runtime"
  default     = 128
}

variable "environment_variables" {
  description = "Map of environment variables that are accessible from the function code during execution"
  default     = {}
}

variable "filepath" {
  description = "The path of your function deployment package"
}

variable "timeout" {
  description = "The timeout in seconds for your lambda"
  default     = 10
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

variable "kms_master_key_id" {
  description = "The ID of your CMK for server-side encryption"
  default     = ""
}

variable "sns_topic_arn" {
  description = "The arn of the sns topic you want to subscribe to"
}

variable "tags" {
  description = "A Map of tags to assign to the object"
  default     = {}
}