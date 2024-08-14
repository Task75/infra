# Create the Helm Charts repository
resource "github_repository" "helm_charts" {
  name        = var.repo_name_Helm_Charts
  description = "Repository for the Coffee API service"
  private     = false
  visibility  = "public"
  has_issues  = true
  has_wiki    = true
  auto_init   = true
}

resource "github_branch_protection" "main_helm_charts_branch_protection" {
  repository_id = github_repository.helm_charts.name
  pattern       = "main"

  allows_deletions    = false
  allows_force_pushes = false

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}
