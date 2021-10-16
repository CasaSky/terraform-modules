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

output "arn" {
  value = aws_lambda_function.lambda.arn
}

output "lambda_execution_role_name" {
  value = aws_iam_role.lambda_execution.name
}