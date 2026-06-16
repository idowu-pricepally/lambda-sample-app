provider "aws" {
  region = "eu-west-1"
}

locals {
  name = "ex-${basename(path.cwd)}"

  tags = {
    Example    = local.name
    GithubRepo = "lambda-sample-app"
    GithubOrg  = "idowu-pricepally"
  }
}

################################################################################
# GitHub OIDC IAM Role
################################################################################

module "github_oidc_iam_role" {
  source = "../../modules/iam-role"

  name = local.name

  enable_github_oidc = true

  # This should be updated to suit your organization, repository, references/branches, etc.
  oidc_subjects = [
    # You can prepend with `repo:` but it is not required
    "repo:idowu-pricepally/lambda-sample-app:pull_request",
    "repo:idowu-pricepally/lambda-sample-app:ref:refs/heads/main",
  ]

  policies = {
    S3ReadOnly = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }

  tags = local.tags
}