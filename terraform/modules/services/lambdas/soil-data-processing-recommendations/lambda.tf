data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda_function.zip"
  excludes    = ["lambda.tf", "variables.tf", "outputs.tf"]
}

resource "aws_lambda_function" "soil_data_processing_recommendations" {
  function_name    = "soil_data_processing_recommendations"
  role             = var.soil_data_processing_recommendations_lambda_role_arn
  handler          = "soil_data_processing_recommendations.lambda_handler"
  runtime          = "python3.9"
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  architectures = ["x86_64"]
}

resource "aws_lambda_permission" "allow_iot" {
  statement_id  = "AllowExecutionFromIoT"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.soil_data_processing_recommendations.function_name
  principal     = "iot.amazonaws.com"
  source_arn    = var.moisture_iot_rule_arn
}
