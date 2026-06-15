output "oidc_provider_arn" {
  description = "The ARN of the Github OIDC provider"
  value       = aws_iam_openid_connect_provider.github_actions.arn
}
