module "iam_role" {
  source              = "./infra/modules/iam_role"
  dynamodb_table_arn  = module.dynamodb.dynamodb_table_arn
  lambda_role_name    = var.lambda_role_name
  lambda_policy_name  = var.lambda_policy_name
  region              = var.region
  dynamodb_table_name = module.dynamodb.dynamodb_table_name
}

module "dynamodb" {
  source        = "./infra/modules/dynamodb"
  name_dynamodb = var.name_dynamodb
  project_name  = var.project_name
}

module "lambda" {
  source                           = "./infra/modules/lambda"
  lambda_role_name                 = module.iam_role.lambda_role_name
  function_name                    = var.function_name
  lambda_role_arn                  = module.iam_role.lambda_role_arn
  dynamodb_table_name              = module.dynamodb.dynamodb_table_name
  dynamodb_policy_attachment_arn   = module.iam_role.dynamodb_policy_attachment_arn
  cloudwatch_policy_attachment_arn = module.iam_role.cloudwatch_policy_attachment_arn

}


module "api_gateway" {
  source                   = "./infra/modules/api_gateway"
  resume_lambda_invoke_arn = module.lambda.resume_lambda_invoke_arn
  lambda_function_name     = module.lambda.lambda_function_name
  region                   = var.region

}