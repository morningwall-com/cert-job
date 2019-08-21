provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = "${tls_private_key.private_key.private_key_pem}"
  email_address   = "admin@cloudevops.it"
}

resource "acme_certificate" "certificate" {
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "www.cloudevops.it"
  subject_alternative_names = ["vault.cloudevops.it"]
  key_type                  = "P384"

  dns_challenge {
    provider = "gcloud"

    config = {
      GCE_PROJECT     = "infra-test-246221"
    }
  }
}

resource "local_file" "certificate_pem" {
    sensitive_content = "${acme_certificate.certificate.certificate_pem}"
    filename = "${path.module}/certificate.pem"
}

resource "local_file" "private_key_pem" {
    sensitive_content = "${acme_certificate.certificate.private_key_pem}"
    filename = "${path.module}/private_key.pem"
}
