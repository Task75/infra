# Create the Coffee API repository
resource "github_repository" "coffee_api" {
  name        = var.repo_name_CoffeeAPI
  description = "Repository for the Coffee API service"
  #private     = false
  visibility  = "public"
  has_issues  = true
  has_wiki    = true
  auto_init   = true
}

# Create the env/staging branch as the first branch in the repository
resource "github_branch" "staging_branch" {
  repository = github_repository.coffee_api.name
  branch     = "env/staging"
}

# Set env/staging as the default branch
resource "github_branch_default" "staging_branch_default" {
  repository = github_repository.coffee_api.name
  branch     = github_branch.staging_branch.branch
}

# Create the main branch based on env/staging
resource "github_branch" "main_branch" {
  repository    = github_repository.coffee_api.name
  branch        = "main"
  source_branch = github_branch.staging_branch.branch
}

# Protect the env/staging branch
resource "github_branch_protection" "staging_branch_protection" {
  repository_id = github_repository.coffee_api.name
  pattern       = "env/staging"

  allows_deletions    = false
  allows_force_pushes = false

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}

# Protect the main branch
resource "github_branch_protection" "main_branch_protection" {
  repository_id = github_repository.coffee_api.name
  pattern       = "main"

  allows_deletions    = false
  allows_force_pushes = false

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}

# Add secrets for PostgreSQL
resource "github_actions_secret" "postgresql_password" {
  repository      = github_repository.coffee_api.name
  secret_name     = "POSTGRESQL_PASSWORD"
  plaintext_value = var.postgresql_password
}

resource "github_actions_secret" "TOKEN" {
  repository      = github_repository.coffee_api.name
  secret_name     = "TOKEN"
  plaintext_value = var.github_token
}

# Add environment variables
resource "github_actions_variable" "postgresql_username" {
  repository    = github_repository.coffee_api.name
  variable_name = "POSTGRESQL_USERNAME"
  value         = var.postgresql_username
}

resource "github_actions_variable" "postgresql_basename" {
  repository    = github_repository.coffee_api.name
  variable_name = "POSTGRESQL_DATABASE"
  value         = var.postgresql_basename
}

