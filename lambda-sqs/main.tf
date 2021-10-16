module "lambda" {
  source = "../lambda"
  function_name = var.function_name
  filepath = var.filepath
  handler = var.handler
  runtime = var.runtime
}

module "sqs" {
  source = "../sqs"
  name = var.function_name
}

resource "aws_iam_role_policy_attachment" "lambda_sqs_role_policy" {
  role       = module.lambda.lambda_execution_role_name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
}

resource "aws_lambda_event_source_mapping" "sqs_mapping" {
  event_source_arn = module.sqs.arn
  function_name    = module.lambda.arn
}