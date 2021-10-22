module "lambda_sqs" {
  source = "../lambda-sqs"
  providers = {
    aws.alternate = aws.alternate
  }

  function_name = var.function_name
  filepath      = var.filepath
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size
  timeout       = var.timeout

  environment_variables = var.environment_variables

  tags = var.tags
}

resource "aws_sqs_queue_policy" "this" {
  provider = aws.alternate

  queue_url = module.lambda_sqs.sqs_id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${module.lambda_sqs.sqs_arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${var.sns_topic_arn}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_sns_topic_subscription" "this" {
  provider = aws.alternate

  topic_arn = var.sns_topic_arn
  protocol  = "sqs"
  endpoint  = module.lambda_sqs.sqs_arn
}