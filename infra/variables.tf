variable "repo_name_CoffeeAPI" {
  description = "Base name of the repository"
  type        = string 
  default     = "coffee-api"
}

variable "staging_branch_name" {
  description = "Name of the staging branch"
  type        = string
  default     = "env/staging"
}

variable "main_branch_name" {
  description = "Name of the main branch"
  type        = string
  default     = "main"
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}


variable "postgresql_password" {
  description = "PostgreSQL password"
  type        = string
  default     = "password"
  sensitive   = true
}

variable "postgresql_username" {
  description = "PostgreSQL username"
  type        = string
  default     = "username"
}

variable "postgresql_basename" {
  description = "PostgreSQL basename"
  type        = string
  default     = "basename"
}
