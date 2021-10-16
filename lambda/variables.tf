variable "function_name" {
  description = "The name of your lambda function"
}

variable "handler" {
  description = "The entrypoint of your function"
}

variable "runtime" {
  description = "The runtime identifier of your function"
}

variable "source_file" {
  description = "The path of your function deployment package"
}