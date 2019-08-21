terraform {
  backend "gcs" {
    bucket  = "cloudevops-remote-state2"
    prefix  = "certs/"
  }
}