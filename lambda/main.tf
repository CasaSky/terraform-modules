resource "aws_iam_role" "this" {
  provider = aws.alternate

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

resource "aws_lambda_function" "this" {
  provider = aws.alternate

  filename      = var.filepath
  function_name = var.function_name
  role          = aws_iam_role.this.arn
  handler       = var.handler

  source_code_hash = filebase64sha256(var.filepath)

  runtime     = var.runtime
  memory_size = var.memory_size

  environment {
    variables = var.environment_variables
  }

  tags = var.tags
}