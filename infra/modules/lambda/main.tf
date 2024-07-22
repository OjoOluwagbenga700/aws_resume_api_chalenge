data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir = "src"
  output_path = "resume_challenge.zip"
}

resource "aws_lambda_function" "resume_lambda_function"  {
  filename      = data.archive_file.lambda_zip.output_path
  function_name = var.function_name
  role          = var.lambda_role_arn
  handler       = "resume_challenge.lambda_handler"
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)
  runtime = "python3.8"
  depends_on = [var.dynamodb_policy_attachment_arn , var.cloudwatch_policy_attachment_arn ]
  environment {
    variables = {
      "TABLE_NAME" = var.dynamodb_table_name
    }
  }
}
  



