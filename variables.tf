variable "environment" {

}

variable "project" {
  default = "roboshop"
}

variable "network_ports" {
    default = [22, 80, 443, 53]
}

variable "zone_id" {
    default = "Z0711084A6IKM873A3LI"
}