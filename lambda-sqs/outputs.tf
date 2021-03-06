output "function_name" {
  value = var.function_name
}

output "handler" {
  value = var.handler
}

output "runtime" {
  value = var.runtime
}

output "filepath" {
  value = var.filepath
}

output "sqs_arn" {
  value = module.sqs.arn
}

output "sqs_id" {
  value = module.sqs.id
}

output "lambda_execution_role_name" {
  value = module.lambda.lambda_execution_role_name
}