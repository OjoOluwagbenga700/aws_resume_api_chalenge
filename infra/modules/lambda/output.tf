output "resume_lambda_invoke_arn" {
  value = aws_lambda_function.resume_lambda_function.invoke_arn
}

output "resume_lambda_arn" {
  value = aws_lambda_function.resume_lambda_function.arn
}

output "lambda_url" {
 value= aws_lambda_function.resume_lambda_function.image_uri
}

output "lambda_function_name" {
  value = aws_lambda_function.resume_lambda_function.function_name
}