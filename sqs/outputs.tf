output "name" {
  value = var.name
}

output "arn" {
  value = aws_sqs_queue.this.arn
}