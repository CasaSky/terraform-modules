module "lambda_sqs" {
  source = "../lambda-sqs"

  function_name = var.function_name
  filepath      = var.filepath
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size

  tags = var.tags
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn = var.sns_topic_arn
  protocol  = "sqs"
  endpoint  = module.lambda_sqs.sqs_arn
}