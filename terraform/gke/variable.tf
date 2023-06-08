variable "project_name" {
  type    = string
  default = "norse-decoder-387302"
}

variable "region" {
  type    = string
  default = "asia-southeast1"
}

variable "zone" {
  type    = string
  default = "asia-southeast1-a"
}

variable "gke-nodes-zone" {
  type    = set(string)
  default = ["asia-southeast1-b"]
}
