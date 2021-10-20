locals {
  policy_arn_list = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
}

module "lambda" {
  source = "../lambda"

  function_name = var.function_name
  filepath      = var.filepath
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size

  environment_variables = var.environment_variables

  tags = var.tags

  depends_on = [
    aws_cloudwatch_log_group.this
  ]
}

module "sqs" {
  source = "../sqs"
  providers = {
    aws.alternate = aws.alternate
  }
  name                      = var.function_name
  kms_master_key_id         = var.kms_master_key_id
  delay_seconds             = var.delay_seconds
  message_retention_seconds = var.message_retention_seconds
  redrive_policy = jsonencode({
    deadLetterTargetArn = module.sqs_dlq.arn
    maxReceiveCount     = 5
  })

  tags = var.tags
}

module "sqs_dlq" {
  source = "../sqs"

  name              = "${var.function_name}-dlq"
  kms_master_key_id = var.kms_master_key_id
  delay_seconds     = var.delay_seconds

  tags = var.tags
}

# needed to manage the log group
resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = 7
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = module.lambda.lambda_execution_role_name
  count      = length(local.policy_arn_list)
  policy_arn = local.policy_arn_list[count.index]
}

resource "aws_lambda_event_source_mapping" "this" {
  event_source_arn = module.sqs.arn
  function_name    = module.lambda.arn
}