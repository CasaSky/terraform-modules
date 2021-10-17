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

variable "memory_size" {
  description = "The amount of memory in MB your lambda function can use at runtime"
  default     = 128
}

variable "environment_variables" {
  description = "Map of environment variables that are accessible from the function code during execution"
  default     = {}
}

variable "tags" {
  description = "A Map of tags to assign to the object"
  default     = {}
}