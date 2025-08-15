resource "google_artifact_registry_repository" "client" {
  repository_id = var.gcp_artifact_repo_client_id
  description   = var.gcp_artifact_repo_client_description
  format        = var.gcp_artifact_repo_client_format
  location      = var.gcp_region

  cleanup_policies {
    id     = "keep-any-tagged"
    action = "KEEP"

    condition {
      tag_state = "TAGGED"
    }
  }

  cleanup_policies {
    id     = "keep-only-recent"
    action = "KEEP"

    most_recent_versions {
      package_name_prefixes = ["client-prd", "client-dev"]
      keep_count = 3
    }
  }

  cleanup_policies {
    id     = "delete-older"
    action = "DELETE"

    condition {
      older_than = "0d"
    }
  }
}
