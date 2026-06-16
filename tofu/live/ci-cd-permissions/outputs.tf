output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the OIDC provider"
  value       = module.github_oidc_iam_role.arn
}