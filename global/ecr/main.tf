resource "aws_ecr_repository" "cli-team-ecr" {
  name                 = "cli-team-ecr"
  image_tag_mutability = "IMMUTABLE"
}
