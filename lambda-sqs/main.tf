module "lambda" {
  source = "../lambda"

  function_name = var.function_name
  filepath      = var.filepath
  handler       = var.handler
  runtime       = var.runtime
}

module "sqs" {
  source = "../sqs"

  name              = var.function_name
  kms_master_key_id = var.kms_master_key_id
  delay_seconds     = var.delay_seconds
  redrive_policy = jsonencode({
    deadLetterTargetArn = module.sqs_dlq.name
    maxReceiveCount     = 5
  })
}

module "sqs_dlq" {
  source = "../sqs"

  name              = var.function_name
  kms_master_key_id = var.kms_master_key_id
  delay_seconds     = var.delay_seconds
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = module.lambda.lambda_execution_role_name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
}

resource "aws_lambda_event_source_mapping" "this" {
  event_source_arn = module.sqs.arn
  function_name    = module.lambda.arn
}