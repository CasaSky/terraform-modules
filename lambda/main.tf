resource "aws_iam_role" "lambda_execution" {
  name = "lambda_execution"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

locals {
  filepath = "${path.module}/../../${var.source_file}"
}

resource "aws_lambda_function" "lambda" {
  filename      = local.filepath
  function_name = var.function_name
  role          = aws_iam_role.lambda_execution.arn

  # package.Class
  handler       = var.handler

  source_code_hash = filebase64sha256(local.filepath)

  runtime = var.runtime
}
