terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "15.9.0"
    }
  }
}

provider "gitlab" {
  token = var.gitlab_token
  base_url = var.gitlab_url
}