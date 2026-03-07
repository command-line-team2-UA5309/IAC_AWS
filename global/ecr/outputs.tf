output "auth_service_repository_url" {
  value = aws_ecr_repository.auth_service.repository_url
}

output "map_service_repository_url" {
  value = aws_ecr_repository.map_service.repository_url
}

output "frontend_repository_url" {
  value = aws_ecr_repository.frontend.repository_url
}

output "dailycode_service_repository_url" {
  value = aws_ecr_repository.dailycode_service.repository_url
}

output "reverse_proxy_repository_url" {
  value = aws_ecr_repository.reverse_proxy.repository_url
}
