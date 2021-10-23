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

// replace to a iam policy module with <<Policy as input
resource "aws_iam_policy" "sns-publish" {
  provider = aws.alternate

  count = length(var.publish_sns_topic_arn_list) > 0 ? 1 : 0

  name        = "sns-publish"
  description = "SNS publish policy"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sns:Publish"
      ],
      "Effect": "Allow",
      "Resource": "${var.publish_sns_topic_arn_list}"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "sns-publish" {
  provider = aws.alternate

  count = length(var.publish_sns_topic_arn_list) > 0 ? 1 : 0

  role       = module.lambda_sqs.lambda_execution_role_name
  policy_arn = aws_iam_policy.sns-publish[0].arn
}