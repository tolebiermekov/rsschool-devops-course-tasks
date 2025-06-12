# rsschool-devops-course-tasks
This repo automates AWS infrastructure with Terraform and GitHub Actions.

## What is provisioned

- S3 bucket for Terraform state
- DynamoDB table for state locking
- OIDC identity provider for GitHub Actions
- IAM role (`GithubActionsRole`) for CI/CD

## How it works

- All infrastructure is described as code in the `01-basic-configuration` directory.
- GitHub Actions pipeline (`.github/workflows/terraform.yml`) runs Terraform commands automatically on each push or PR.
- Secure authentication uses OIDC.