# Coffee API GitHub Repository

This repository is automatically managed using Terraform. It includes infrastructure setup, branch management, and secret handling for the Coffee API service.

## Overview

This Terraform configuration automates the creation and management of the GitHub repository for the Coffee API service. It includes setting up branches, branch protection rules, and GitHub secrets/variables required for the API service.

## Features

- **Repository Creation**: The repository is created with the specified name, description, and visibility.
- **Branch Management**:
  - `env/staging` branch is created as the first branch.
  - `env/staging` is set as the default branch.
  - `main` branch is created based on `env/staging`.
- **Branch Protection**:
  - `env/staging` and `main` branches are protected from forced pushes and deletions, and require pull request reviews.
- **Secrets and Variables**:
  - PostgreSQL credentials (username and password) are securely stored as GitHub secrets and variables.
  - GitHub token is securely handled via GitHub secrets.

## Requirements

- **Terraform**: `>= 1.6.4`
- **GitHub Provider**: `6.0`

## Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-organization/coffee-api.git
   cd coffee-api
