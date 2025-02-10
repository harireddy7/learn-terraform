# Provider

provider "google" {
  project = "learn-terraform-450109"
  region  = "asia-south1"
}

resource "google_cloud_run_service" "default" {
  name     = "release"
  location = "asia-south1"

  template {
    spec {
      containers {
        image = "asia-south1-docker.pkg.dev/learn-terraform-450109/arsenal/release:0.0.1"
        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default.location
  service  = google_cloud_run_service.default.name

  policy_data = jsonencode({
    bindings = [
      {
        role    = "roles/run.invoker"
        members = ["allUsers"]
      }
    ]
  })
}
