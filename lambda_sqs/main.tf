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

resource "aws_lambda_event_source_mapping" "sqs_mapping" {
  event_source_arn = module.sqs.arn
  function_name    = module.lambda.arn
}