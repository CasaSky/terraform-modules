output "name" {
  value = var.name
}

output "arn" {
  value = aws_sqs_queue.this.arn
}

output "id" {
  value = aws_sqs_queue.this.id
}