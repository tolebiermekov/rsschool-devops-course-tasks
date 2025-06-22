variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-north-1"
}

variable "state_bucket_name" {
  description = "This is a S3 Bucket name for TF state"
  type        = string
  default     = "rs-tf-state-tolebi"
}

variable "lock_table_name" {
  description = "This is a DynamoDB table for Locking state files"
  type        = string
  default     = "rs-tf-lock-table-tolebi"
}

variable "github_org" {
  description = "GitHub username or organization"
  type        = string
  default     = "tolebiermekov"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "rsschool-devops-course-tasks"
}