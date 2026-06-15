output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the OIDC provider"
  value       = module.github_oidc_iam_role.arn
}

################################################################################
# OIDC Provider
################################################################################
output "url" {
  description = "The URL of the identity provider. Corresponds to the iss claim"
  value       = module.github_oidc_iam_provider.url
}