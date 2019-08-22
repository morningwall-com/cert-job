# cert-job

A clean and neat way to generate and renew [letsencrypt](https://letsencrypt.org/) certificates using the terraform [ACME provider](https://www.terraform.io/docs/providers/acme/index.html) and google [Cloud Build](https://cloud.google.com/cloud-build/).

# usage
Fork this repo and create a Cloud Build trigger in your gcp project. Configure the variables below in you Cloud Build trigger.

## Variables:
- `_BACKEND_BUCKET` the bucket used by gcs backend.
- `_BACKEND_PREFIX` the path in `_BACKEND_BUCKET` where the remote state will be saved.
- `_CERT_PROJECT` the project containing the cloud dns zone we want to create the certificate for.
- `_EMAIL` the email address used for the `acme_registration`.
- `_COMMON_NAME` the primary domain that the certificate will be recognized for (e.g. www.example.com)
- `_SUBJECT_ALT_NAME` domains that this certificate will also be recognized for (comma separated and quoted values, e.g. `"sub1.example.com", "sub2.example.com"`)
- `_CERT_BUCKET` the bucket where to store the artifacts: the key and the certificate.
