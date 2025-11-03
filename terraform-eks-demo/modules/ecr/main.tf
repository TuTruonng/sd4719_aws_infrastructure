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