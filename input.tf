variable "email" {
  type = string
}

variable "common_name" {
  type = string
}

variable "subject_alternative_names" {
  type = list(string)
}

variable "cert_project" {
  type = string
}
