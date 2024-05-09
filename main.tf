terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "stable-diffusion-web-ui-on-gcp"
}

resource "google_compute_instance" "stable-diffusion-webui" {
  name         = "stable-diffusion-webui"
  machine_type = "n1-highmem-2"
  zone         = "${var.region}-${var.zone_suffix}"
  tags         = ["http-server"]

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/stable-diffusion-web-ui-on-gcp/regions/${var.region}/subnetworks/default"
  }

  boot_disk {
    device_name = "stable-diffusion-webui"

    initialize_params {
      size  = 25
      type  = "pd-standard"
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20240228"
    }
  }

  guest_accelerator {
    count = 1
    type  = "projects/stable-diffusion-web-ui-on-gcp/zones/${var.region}-${var.zone_suffix}/acceleratorTypes/nvidia-tesla-t4"
  }


  scheduling {
    on_host_maintenance = "TERMINATE"
  }

  service_account {
    email  = "36827710358-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
}
