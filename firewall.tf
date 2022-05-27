
resource "google_compute_firewall" "fw1" {
  name    = "test-firewall1"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}


resource "google_compute_firewall" "fw2" {
  name    = "test-firewall2"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]

  log_config {
    metadata = "EXCLUDE_ALL_METADATA"
  }
}