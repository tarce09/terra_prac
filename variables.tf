variable "names"{
    type = list(string)
    default = [
        "new_server_1",
        "new_server_2",
    ]
}

variable "subnet_id" {
  default = "subnet-00649c426d4d8beb6"
}