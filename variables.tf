variable "instance_type" {
}

variable "environment" {

}

variable "project" {
  default = "roboshop"
}

variable "network_ports" {
    default = [22, 36, 65, 53]
}