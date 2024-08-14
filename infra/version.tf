terraform {
  required_version = ">= 1.6.4"

  backend "local" {
    path = "./infra/terraform.tfstate"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.0"
    }
  }
}
