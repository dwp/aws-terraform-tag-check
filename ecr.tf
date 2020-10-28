resource "aws_ecr_repository" "aws-terraform-tag-check" {
  name = "aws-terraform-tag-check"
  tags = merge(
    local.common_tags,
    { DockerHub : "dwpdigital/aws-terraform-tag-check" }
  )
}

resource "aws_ecr_repository_policy" "aws-terraform-tag-check" {
  repository = aws_ecr_repository.aws-terraform-tag-check.name
  policy     = data.terraform_remote_state.management.outputs.ecr_iam_policy_document
}

output "ecr_example_url" {
  value = aws_ecr_repository.aws-terraform-tag-check.repository_url
}
