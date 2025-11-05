resource "aws_ecr_repository" "repos" {
  for_each = toset(var.repositories)
  name     = each.key

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = {
    Name = each.key
  }
}

resource "aws_ecr_lifecycle_policy" "keep_latest" {
  repository = aws_ecr_repository.repos.name

  policy = <<POLICY
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 5 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 5
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
POLICY
}