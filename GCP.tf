:esource "google_compute_instance" "database" {
  machine_type = "n1-standard-1"
  name = "database"
  zone = "us-west1-a"
  tags= ["db"]
  boot_disk {
    initialize_params {
      image = "ubunt-os-cloud/ubuntu-18.4-lts"
    }
  }
  // Local SSD disk
  scratch_disk {
      }
  network_interface {
      network = "default"
    access_config {
      // Ephemeral IP
    }
  }
  metadata {
    sshKeys =  "ubuntu:$ {file (var.ssh_public_key_filepath)}"
  }
}

