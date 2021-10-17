variable "name" {
  description = "The name of your sqs queue"
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed"
  default = 1
}

variable "redrive_policy" {
  description = "The JSON policy to set up the Dead Letter Queue"
  default = ""
}