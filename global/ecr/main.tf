resource "aws_ecr_repository" "auth_service" {
  name                 = "cli-team/auth-service"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "map_service" {
  name                 = "cli-team/map-service"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "frontend" {
  name                 = "cli-team/frontend"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "dailycode_service" {
  name                 = "cli-team/dailycode-service"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "reverse_proxy" {
  name                 = "cli-team/reverse-proxy"
  image_tag_mutability = "IMMUTABLE"
}
