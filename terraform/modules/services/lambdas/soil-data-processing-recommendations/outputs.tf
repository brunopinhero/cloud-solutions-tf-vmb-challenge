output "soil_data_processing_recommendations_lambda_arn" {
  value = aws_lambda_function.moisture_task_planner.arn
}

# Output da URL do API Gateway
output "api_url" {
  description = "Base URL for API Gateway stage"
  value       = aws_api_gateway_stage.prod.invoke_url
}