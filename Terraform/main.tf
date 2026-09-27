terraform {
  required_version = "1.16.3"

  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = ">= 4.0.0, < 5.0.0"
    }

    hcp = {
      source = "hashicorp/hcp"
    }

    local = {
      source = "hashicorp/local"
    }

  }

  cloud {
    organization = "Blyndthor"

    workspaces {
      name = "Url_Shortener"
    }

  }
}

provider "aiven" {
  api_token = var.aiven_token
}

# Your Aiven project
data "aiven_project" "main" {
  project = var.aiven_project_name
}

# PostgreSQL service
resource "aiven_pg" "pg" {
  project      = data.aiven_project.main.project
  service_name = var.postgres_service_name
  plan         = "free"
}

output "pg_service_uri" {
  value     = aiven_pg.pg.service_uri
  sensitive = true
}

