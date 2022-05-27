resource "google_compute_instance" "instance1" {
  name         = "test1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = google_compute_network.default.name

  }

  metadata = {
    block-project-ssh-keys = "true"
  }

}