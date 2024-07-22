output "dynamodb_table_name" {
  value = aws_dynamodb_table.resume_table.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.resume_table.arn
}