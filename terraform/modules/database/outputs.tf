output "dynamodb_table_task_plans_arn" {
  value = aws_dynamodb_table.task_plans.arn
}

output "dynamodb_table_agricultural_moisture_recommendations_arn" {
  value = aws_dynamodb_table.agricultural_moisture_recommendations.arn
}

output "dynamodb_tfstate_table_name" {
  value       = aws_dynamodb_table.terraform_state_lock.id
  description = "The name of the DynamoDB table"
}

output "agricultural_moisture_recommendations_tabledb_stream_arn" {
  value = aws_dynamodb_table.agricultural_moisture_recommendations.stream_arn
}