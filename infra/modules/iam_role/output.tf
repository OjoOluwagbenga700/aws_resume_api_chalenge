output "lambda_role_name" {
  value = aws_iam_role.lambda_role.name
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}

output "lambda_cloudwatch_policy_name" {
  value = aws_iam_policy.lambda_cloudwatch_policy.name
}

output "lambda_cloudwatch_policy_arn" {
  value = aws_iam_policy.lambda_cloudwatch_policy.arn
}

output "lambda_dynamodb_policy_name" {
  value = aws_iam_policy.lambda_dynamodb_policy.name
}

output "lambda_dynamodb_policy_arn" {
  value = aws_iam_policy.lambda_dynamodb_policy.arn
}

output "dynamodb_policy_attachment_arn" {
  value =  aws_iam_role_policy_attachment.attach_dynamodb_policy.policy_arn
}

output "cloudwatch_policy_attachment_arn" {
  value =  aws_iam_role_policy_attachment.attach_cloudwatch_policy.policy_arn
}

