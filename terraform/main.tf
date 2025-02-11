# PROVIDERS

provider "google" {
  project = "learn-terraform-450109"
  region  = "asia-south1"
}

resource "google_cloud_run_service" "default" {
  name     = "release2"
  location = "asia-south1"

  template {
    spec {
      containers {
        image = var.image_path
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

# RESOURCES

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

# VARIABLES

variable "image_path" {
  description = "Docker release image"
  type = string
  default = "asia-south1-docker.pkg.dev/learn-terraform-450109/arsenal/release:latest"
}
