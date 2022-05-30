resource "google_service_account" "service_account" {
  account_id   = "notebook-account"
  display_name = "Service Account"
}

resource "google_notebooks_instance" "instance" {
  project      = var.project_id
  name         = "test-notebook"
  location     = "us-central1-a"
  machine_type = "n1-standard-1"
  labels       = {}

  accelerator_config {
    type       = "NVIDIA_TESLA_T4"
    core_count = 1
  }


  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }

  instance_owners = ["ashwinknaik@google.com"]
  service_account = google_service_account.service_account.email

  install_gpu_driver = "true"
  boot_disk_type     = "PD_SSD"
  boot_disk_size_gb  = 200
  disk_encryption    = ""

  no_public_ip    = true
  no_proxy_access = false

  network = google_compute_network.default.id
  subnet  = google_compute_subnetwork.subnet1.id

  metadata = {
    startup-script-url = "gs://tf_ccoe_notebooks_test_scripts/startup.sh"
  }

}
